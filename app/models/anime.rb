class Anime < ApplicationRecord
  MAX_SIZE_OF_POSTER = 2097152

  has_many :arcs
  has_many :episodes

  validates :canonical, :russian, presence: true

  enumerize :age_rating, in: Types::Anime::AGE_RATING.values
  enumerize :status, in: Types::Anime::STATUS.values
  enumerize :kind, in: Types::Anime::KIND.values

  def poster=(obj)
    @poster = obj
  end

  def poster
    @poster
  end

  def poster_upload obj
    Aws::S3::Object.new(
      client: Aws::S3::Client.new,
      bucket_name: Animelib::Application::S3_BUCKET,
      key: "anime-posters/#{self.id}.jpg"
    ).upload_file(obj)
  end

  def poster_url
    Aws::S3::Object.new(
      client: Aws::S3::Client.new,
      bucket_name: Animelib::Application::S3_BUCKET,
      key: "anime-posters/#{id}.jpg"
    ).presigned_url(:get)
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
end
