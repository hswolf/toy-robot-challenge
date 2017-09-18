class Direction
  DIRECTIONS = %w(NORTH EST SOUTH WEST)

  def self.is_a_direction?(direction)
    DIRECTIONS.include?(direction.upcase)
  end

  def self.rotate_left(current_direction)
    index = DIRECTIONS.find_index(current_direction.upcase)
    return if index.nil?

    DIRECTIONS[index - 1]
  end

  def self.rotate_right(current_direction)
    index = DIRECTIONS.find_index(current_direction.upcase)
    return if index.nil?

    DIRECTIONS[index + 1]
  end
end