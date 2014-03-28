module Decoratable
  class SelfDecorationError < RuntimeError; end

  def with(decorator)
    raise SelfDecorationError.new("Cannot self-decorate") if decorator == self
    decorator.decoratee = self
    decorator
  end

end

module Decorator
  include Decoratable

  attr_accessor :decoratee

  def method_missing(method_name, *args)
    decoratee.send(method_name, *args)
  end
end
