require_relative 'position'
require_relative '../cardinal/direction'

class Rover
  # access the constant direction Hash in Cardinal module via mixin
  include Cardinal

  attr_accessor :position
  attr_reader :orientation

  def initialize(orientation, position)
    @orientation = direction(orientation)
    @position = position
  end

  def orientation=(value)
    @orientation = direction(value)
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

  # the rover's position will change my one unit in the
  # direction it faces
  def move_forward
    case @orientation
      when :north
      @position.y_coordinate += 1
      when :east
      @position.x_coordinate += 1
      when :south
      @position.y_coordinate -= 1
      when :west
      @position.x_coordinate -= 1
    end
  end

  # output the location in the format "x y N"
  def location
    "#{@position} #{DIRECTIONS[@orientation]}"
  end

  # validation method for use in rspec tests
  def valid?
    DIRECTIONS.include?(@orientation) and @position.valid?
  end
end
