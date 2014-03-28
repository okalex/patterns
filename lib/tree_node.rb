class TreeNode

  attr_reader :value, :children

  def initialize(strategy, value)
    @strategy = strategy
    @value = value
    @children = []
  end

  def to_s
    @value.to_s
  end

  def add(value)
    @strategy.add(self, value)
  end

  def find(value)
    @strategy.find(self, value)
  end

end
