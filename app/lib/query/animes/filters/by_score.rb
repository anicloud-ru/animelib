class Animes::Filters::ByScore < Animes::Filters::FilterBase
  def call
    scope = @scope
    case @value
    when 'best'
      scope = scope.where('score >= 9')
    when 'good'
      scope = scope.where('score >= 8 AND score < 9')
    when 'ordinary'
      scope = scope.where('score >= 7 AND score < 8')
    when 'mediocre'
      scope = scope.where('score >= 6 AND score < 7')
    when 'bad'
      scope = scope.where('score < 6')
    else
      scope
    end
    scope
  end
end