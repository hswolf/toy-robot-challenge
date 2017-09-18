require_relative 'playground'
require_relative 'position'
require_relative 'direction'

class Robot
  attr_accessor :position, :direction, :playground

  def initialize(playground)
    validate!(playground)

    @playground = playground
  end

  def place(x, y, direction)
    position = Position.new(x, y)
    return unless @playground.position_is_inside?(position)
    return unless Direction.is_a_direction?(direction)

    @position = position
    @direction = direction
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