class Position
  attr_accessor :x, :y

  def initialize(x, y)
    validate!(x, y)

    @x = x
    @y = y
  end

  private

  def validate!(x, y)
    
  end
end