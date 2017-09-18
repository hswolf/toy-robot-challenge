class Position
  attr_accessor :x, :y

  def initialize(x, y)
    validate!(x, y)

    @x = x
    @y = y
  end

  private

  def validate!(x, y)
    raise ArgumentError.new('X must be an Integer') unless x.is_a?(Integer)
    raise ArgumentError.new('Y must be an Integer') unless y.is_a?(Integer)
  end
end