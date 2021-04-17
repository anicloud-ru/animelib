class Anime < ApplicationRecord
  has_many :arcs

  enumerize :age_rating, in: Types::Anime::AGE_RATING.values
  enumerize :status, in: Types::Anime::STATUS.values
  enumerize :kind, in: Types::Anime::KIND.values

  def poster_url
    s3 = Aws::S3::Client.new
    objecto = Aws::S3::Object.new(client: s3, bucket_name: 'animelib-s3-stoke', key: "anime-posters/#{id}.jpg")
    objecto.presigned_url(:get)
  end

  def gh ids, klass
    r = Array.new
    ids.each do |i|
      id = klass.classify.constantize.find(i)
      r.push(id)
      klass == "Hashtag" ? id.searches_increase : break
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
