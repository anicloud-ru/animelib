class Animes::Filters::ByHashtag < Animes::Filters::FilterBase
  def call
    scope = @scope
    @value.each do |v|
      scope = scope.where("hashtags_ids && '{#{v.to_i}}'")
    end
    scope
  end
end
