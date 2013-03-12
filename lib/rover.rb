require 'position'

class Rover
  attr_reader :orientation, :position

  def initialize(orientation, position)
    @orientation = orientation
    @position = position
  end

  # not sure if this should be done here - probably best in RoverCommand
  def initialize(heading, x_coordinate, y_coordinate)
    case heading
      when 'N'
      @orientation = :north
      when 'S'
      @orientation = :south
      when 'E'
      @orientation = :east
      when 'W'
      @orientation = :west
      else
      @orientation = :north
    end

    @position = Position.new(x_coordinate, y_coordinate)
  end

  def turn_left
    current_orientation = @orientation
    case current_orientation
      when :north
      new_orientation = :west
      when :east
      new_orientation = :north
      when :south
      new_orientation = :east
      when :west
      new_orientation = :south
      else
      new_orientation = :west
    end
    @orientation = new_orientation
  end

  def turn_right
    current_orientation = @orientation
    case current_orientation
      when :north
      new_orientation = :east
      when :east
      new_orientation = :south
      when :south
      new_orientation = :west
      when :west
      new_orientation = :north
      else
      new_orientation = :east
    end
    @orientation = new_orientation
  end

  def move_forward
    case @orientation
      when :north
      @position.y_coordinate += 1
      when :east
      @position.x_coordinate += 1
      when :south
      @position.y_coordinate -= 1
      when :west
      @position.y_coordinate -= 1
    end
  end

  def location?
    @orientation[0].to_s.upcase + ' ' +  @position.to_s
  end

  def valid?
    true
  end
end
