class TableSurface
  attr_accessor :length, :height

  def initialize(length, height)
    validate!(length, height)

    @length = length
    @height = height
  end

  def inside_table_surface?(position)
  end

  private

  def validate!(length, height)
    if !length.is_a?(Integer) || length < 0
      raise ArgumentError.new('Length must be an integer and greater than or equal to 0')
    end

    if !height.is_a?(Integer) || height < 0
      raise ArgumentError.new('Height must be an integer and greater than or equal to 0')
    end
  end
end