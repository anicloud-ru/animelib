class Animes::Filters::ByGenre < Animes::Filters::FilterBase
  def call
    scope = @scope
    @value.each do |v|
      scope = scope.where("genres_ids && '{#{v.to_i}}'")
    end
    scope
  end
end
