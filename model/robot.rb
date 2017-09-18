require_relative 'playground'

class Robot
  attr_accessor :position, :direction, :playground

  def initialize(playground)
    validate!(playground)

    @playground = playground
  end

  def place(x, y, direction)
    
  end

  def move
    
  end

  def left
    
  end

  def right
    
  end

  def report
    
  end

  private

  def validate!(playground)
    raise ArgumentError.new('Invalid type of playground') unless playground.is_a?(Playground)
  end
end