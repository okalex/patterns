require_relative './test_helper'
require_relative '../lib/decorator'

class Coffee
  include Decoratable

  def cost
    2.0
  end

  def name
    "Cappuccino"
  end

end

class Milk
  include Decorator

  def cost
    decorator_parent.cost + 0.5
  end
end

class Sugar
  include Decorator

  def cost
    decorator_parent.cost + 0.25
  end
end

class DecoratorTest < TestCase
  c = Coffee.new

  test "Coffee works properly" do
    assert { c.cost == 2.0 }
    assert { c.name == "Cappuccino" }
  end

  test "Coffee with Milk" do
    c = c.with(Milk.new)
    assert { c.cost == 2.5 }
    assert { c.name == "Cappuccino" }
  end

  test "with sugar" do
    c = c.with(Sugar.new)
    assert { c.cost == 2.75 }
    assert { c.name == "Cappuccino" }
  end

  test "with another sugar" do
    c = c.with(Sugar.new)
    assert { c.cost == 3.0 }
    assert { c.name == "Cappuccino" }
  end

  c = Coffee.new
  test 'Coffee is okay' do
    assert { c.cost == 2.0 }
  end

  s = Sugar.new
  m = Milk.new

  test 'with milk' do
    c = c.with(m)
    assert { c.cost == 2.5 }
  end

  test 'with sugar' do
    c = c.with(s)
    assert { c.cost == 2.75 }
  end

  test 'with another sugar raises' do
    assert_exception(Decoratable::SelfDecorationError) { c = c.with(s) }
  end
end

DecoratorTest.run
