class Position
  attr_accessor :x, :y

  def initialize(x, y)
    @x = Integer(x)
    @y = Integer(y)
  end
end