class Anime < ApplicationRecord

  enumerize :age_rating, in: Types::Anime::AGE_RATING.values
  enumerize :status, in: Types::Anime::STATUS.values
  enumerize :kind, in: Types::Anime::KIND.values

  def genres
    ids = self.genres_ids.to_a
    genres = Array.new
    ids.each do |i|
      genres.push(Genre.find(i))
    end
    genres
  end

  def hashtags
    ids = self.hashtags_ids.to_a
    hashtags = Array.new
    ids.each do |i|
      h = Hashtag.find(i)
      h.searches_increase
      hashtags.push(h)
    end
    hashtags
  end
end
