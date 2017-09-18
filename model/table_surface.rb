require_relative 'playground'
require_relative 'position'

class TableSurface < Playground
  attr_accessor :width, :height

  def initialize(width, height)
    validate!(width, height)

    @width = width
    @height = height
  end

  def position_is_inside?(position)
    raise ArgumentError.new('Position is invalid') unless position.is_a?(Position)

    (0..(@width - 1)).include?(position.x) && (0..(@height - 1)).include?(position.y)
  end

  private

  def validate!(width, height)
    if !width.is_a?(Integer) || width < 0
      raise ArgumentError.new('Length must be an integer and greater than or equal to 0')
    end

    if !height.is_a?(Integer) || height < 0
      raise ArgumentError.new('Height must be an integer and greater than or equal to 0')
    end
  end
end