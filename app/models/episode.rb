class Episode < ApplicationRecord
  has_many :videos
  belongs_to :anime
end
