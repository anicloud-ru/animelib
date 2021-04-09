class HashtagsSort
  include Sidekiq::Worker
  def perform
    hashtags = Hashtag.all.order(day_searches: :desc)
    i = 1
    hashtags.each do |h|
      chashtag = Hashtag.find(h.id)
      chashtag.day_searches = 0
      chashtag.popularity = i
      chashtag.save!
      i = i + 1
    end
  end
end
