class Anime < ApplicationRecord
  has_many :arcs
  has_many :episodes

  validates :canonical, :russian, presence: true

  enumerize :age_rating, in: Types::Anime::AGE_RATING.values
  enumerize :status, in: Types::Anime::STATUS.values
  enumerize :kind, in: Types::Anime::KIND.values

  has_one_attached :poster

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
