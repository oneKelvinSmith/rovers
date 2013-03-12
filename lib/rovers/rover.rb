require 'rovers/position'
require 'cardinal/direction'

class Rover
  # access the constant direction Hash in Direction module

  attr_accessor :position
  attr_reader :orientation

  def initialize(orientation, position)
    @orientation = cardinal_direction(orientation)
    @position = position
  end

  def orientation=(value)
    @orientation = cardinal_direction(value)
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
      @position.x_coordinate -= 1
    end
  end

  def location
    "#{Cardinal::DIRECTIONS[@orientation]} #{@position}"
  end

  def valid?
    Cardinal::DIRECTIONS.include?(@orientation) and @position.valid?
  end

  private
  def cardinal_direction(value)
    # rovers will align along the Martian magnetic if confused about
    # their orientation. Mars has magnetic north (this may be a thumbsuck).
    Cardinal::DIRECTIONS.include?(value) ? value : :north
  end
end
