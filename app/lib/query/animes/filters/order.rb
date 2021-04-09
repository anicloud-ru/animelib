class Animes::Filters::Order < Animes::Filters::FilterBase
  def call
    scope = @scope
    scope.order("#{@value} desc")
  end
end
