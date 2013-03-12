# command class that will read instructions from input file and
# issue commands to the rovers
class RoverCommand

  def read_input
    
  end

  def set_plateau_size
    
  end

  def locate_rovers
    orientation = char_to_direction(heading)
    position = Position.new(x_value, y_value)
  end

  def char_to_direction(char)
    case char
      when 'N'
      :north
      when 'S'
      :south
      when 'E'
      :east
      when 'W'
      :west
      else
      :north # confused rovers always face north
    end
  end
end
