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
    return if @position.nil? || @direction.nil?
    new_position = Position.new(@position.x, @position.y)

    case @direction
    when Direction::NORTH
      new_position.y += 1
    when Direction::EST
      new_position.x += 1
    when Direction::SOUTH
      new_position.y -= 1
    when Direction::WEST
      new_position.x -= 1
    end

    return unless @playground.position_is_inside?(new_position)

    @position.x = new_position.x
    @position.y = new_position.y
  end

  %w(left right).each do |rotate_way|
    define_method(rotate_way) do
      return if @position.nil? || @direction.nil?

      new_direction = Direction.send("rotate_#{rotate_way}", @direction)
      @direction = new_direction
    end
  end

  def report
    "#{@position.y}, #{@position.x}, #{@direction}"
  end

  private

  def validate!(playground)
    raise ArgumentError.new('Invalid type of playground') unless playground.is_a?(Playground)
  end
end