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
  end
end