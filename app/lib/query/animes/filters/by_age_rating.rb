class Animes::Filters::ByAgeRating < Animes::Filters::FilterBase
  def call
    scope = @scope
    scope.where(:age_rating => @value)
  end
end
