# Design Patterns in Ruby

This is a library of building blocks to replicate common design patterns, as described
in the Gang of Four book. Use them as you see fit.

## Decorator

The decorator pattern is used to add functionality to an object at run time. For instance,
you could do the following:

```
class Coffee
  include Decoratable

  def cost
    2.0
  end
end

class Milk
  include Decorator

  def cost
    decoratee + 0.5
  end
end

class Sugar
  include Decorator

  def cost
    decoratee + 0.25
  end
end

cuppa = Coffee.new
puts cuppa.cost
\# 2.0

cuppa = cuppa.with(Milk.new)
puts cuppa.cost
\# 2.5

cuppa = cuppa.with(Sugar.new)
puts cuppa.cost
\# 2.75
```
