class Animes::Query < QueryBase
  def self.fetch(scope:, params:)
    new_scope = self.new(scope.all)
                    .by_kind(params[:kind])
                    .by_genre(params[:genre])
                    .by_score(params[:score])
                    .by_age_rating(params[:age_rating])
                    .by_hashtag(params[:hashtag])
                    .order(params[:order].nil? ? 'score' : params[:order])
  end

  def by_kind(param)
    return self if param.nil?
    self.class.new(Animes::Filters::ByKind.call(@scope, param))
  end

  def by_genre(param)
    return self if param.nil?
    self.class.new(Animes::Filters::ByGenre.call(@scope, param.split(",")))
  end

  def by_score(param)
    return self if param.nil?
    self.class.new(Animes::Filters::ByScore.call(@scope, param))
  end

  def by_age_rating(param)
    return self if param.nil?
    self.class.new(Animes::Filters::ByAgeRating.call(@scope, param))
  end

  def by_hashtag(param)
    return self if param.nil?
    self.class.new(Animes::Filters::ByHashtag.call(@scope, param.split(",")))
  end

  def order(param)
    return self if param.nil?
    self.class.new(Animes::Filters::Order.call(@scope, param))
  end
end
