class Anime < ApplicationRecord
  MAX_SIZE_OF_POSTER = 2097152

  has_many :arcs
  has_many :episodes

  validates :canonical, :russian, presence: true

  enumerize :age_rating, in: Types::Anime::AGE_RATING.values, predicates: { prefix: true }
  enumerize :status, in: Types::Anime::STATUS.values, predicates: { prefix: true }
  enumerize :kind, in: Types::Anime::KIND.values, predicates: { prefix: true }

  def poster=(obj)
    @poster = obj
  end

  def poster
    @poster
  end

  def poster_upload obj
    s3obj("anime-posters/#{self.id}.jpg").upload_file(obj)
  end

  def poster_url
    obj = s3obj("anime-posters/#{id}.jpg")
    if obj.exists?
      r = Redis.new(host: ENV['REDIS_HOST'], port: 6379, password: ENV['REDIS_PASS'])
      uri = r.get("poster:#{id}")
      if uri.nil?
        uri = obj.presigned_url(:get, expires_in: 3600)
        r.set("poster:#{id}", uri, ex: 3500)
      end
      uri
    else
      s3obj("anime-posters/no-poster.jpg").presigned_url(:get)
    end

  end

  def gh ids, klass
    r = Array.new
    ids.each do |i|
      id = klass.classify.constantize.find(i)
      r.push(id)
      if klass == "Hashtag"
        id.searches_increase
      end
    end
    r
  end

  def genres
    gh self.genres_ids.to_a, "Genre"
  end

  def hashtags
    gh self.hashtags_ids.to_a, "Hashtag"
  end

  private
  def s3obj(key)
    Aws::S3::Object.new(
      client: Aws::S3::Client.new,
      bucket_name: Animelib::Application::S3_BUCKET,
      key: key
    )
  end
end
