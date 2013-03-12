require 'plateau'

# The Position class is a simple container for an (x, y) coordinate.
# A position is relative to a Plateau and is bounded by the width and breadth
# of the plateau instance. A position can not be negative or exceed 100 units.
class Position
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_value, y_value)
    @x_coordinate = Plateau.instance.bound_by_breadth(x_value)
    @y_coordinate = Plateau.instance.bound_by_length(y_value)
  end

  # custom setter method that ensures that the x coordinate is valid and in bounds
  def x_coordinate=(value)
    @x_coordinate = Plateau.instance.bound_by_breadth(value)
  end

  # custom setter method that ensures that the y coordinate is valid and in bounds
  def y_coordinate=(value)
    @y_coordinate = Plateau.instance.bound_by_length(value)
  end

  # custom to_s method to output the position in the desired format
  def to_s
    @x_coordinate.to_s + ' ' + @y_coordinate.to_s
  end

  def valid?
    @x_coordinate >= Plateau.instance.lower_bound and @x_coordinate < Plateau.instance.breadth and
      @y_coordinate >= Plateau.instance.lower_bound and @y_coordinate < Plateau.instance.length
  end
end
