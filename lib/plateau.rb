require 'singleton'

class Plateau
  # Use the Singleton pattern because there is only one Plateau with
  # Mars Rovers on it.
  include Singleton

  # using the assumption that no plateau will have a length
  # or breadth exceeding 100 units or have negative size.
  LOWER_BOUND = 0
  UPPER_BOUND = 100
  MIN_DISTANCE = 1

  # endure that the plateau has a valid size
  attr_reader :length, :breadth

  def initialize
    @breadth = @length = UPPER_BOUND
  end

  def length=(value)
    @length = bound(value, MIN_DISTANCE, UPPER_BOUND)
  end

  def breadth=(value)
    @breadth = bound(value, MIN_DISTANCE, UPPER_BOUND)
  end

  # return the value of the lower bound
  def lower_bound
    LOWER_BOUND
  end

  #return the value of the upper bound
  def upper_bound
    UPPER_BOUND
  end

  def bound_by_length(value)
    bound(value, LOWER_BOUND, @length)
  end

  def bound_by_breadth(value)
    bound(value, LOWER_BOUND, @breadth)
  end

  def valid?
    @breadth >= MIN_DISTANCE and @breadth < UPPER_BOUND and
      @length >= MIN_DISTANCE and @length < UPPER_BOUND
  end

  private
  # private instance method to ensure that coordinate or size value is in bounds
  def bound(value, lower_bound, upper_bound)
    # handle nil inputs for coordinates or dimensions
    if value.nil? or value < lower_bound
      lower_bound
    elsif value > upper_bound
      upper_bound
    else
      value
    end
  end
end
