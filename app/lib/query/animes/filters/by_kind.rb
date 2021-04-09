class Animes::Filters::ByKind < Animes::Filters::FilterBase
  def call
    scope = @scope
    scope.where(:kind => @value)
  end
end
