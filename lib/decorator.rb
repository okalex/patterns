module Decoratable
  class SelfDecorationError < RuntimeError; end

  def with(decorator)
    raise SelfDecorationError.new("Cannot self-decorate") if decorator == self
    decorator.decorator_parent = self
    decorator
  end

end

module Decorator
  include Decoratable

  attr_accessor :decorator_parent

  def method_missing(method_name, *args)
    decorator_parent.send(method_name, *args)
  end
end
