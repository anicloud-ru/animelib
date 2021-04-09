class Hashtag < ApplicationRecord
  def searches_increase
    self.increment(:day_searches, 1)
    self.increment(:searches, 1)
    self.save!
  end
end
