class QueryBase
  attr_initialize :scope

  def respond_to?(*args)
    super(*args) || @scope.respond_to?(*args)
  end

  def respond_to_missing?(*args)
    super(*args) || @scope.send(:respond_to_missing?, *args)
  end

  def method_missing(method, *args, &block)
    @scope.send method, *args, &block
  end
end
