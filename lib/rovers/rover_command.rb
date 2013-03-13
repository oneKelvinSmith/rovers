require_relative 'rover'
require_relative '../cardinal/direction'

require 'pathname'

# command class that will read instructions from input file and
# issue commands to the rovers
class RoverCommand
  include Cardinal

  ALAS = "Rovers have been lost to the void. Alas!"

  # these accessors are to allow manual testing in pry or irb
  attr_accessor :input, :output, :command_lines, :rovers

  def initialize
    command_dir = File.expand_path File.dirname(__FILE__)
    @input = Pathname.new("#{command_dir}/../../spec/fixtures/input.txt")
    @output = Pathname.new("#{command_dir}/../../spec/fixtures/output.txt")
    @rovers = {}
  end

  def read_input
    # reverse the array because array.pop works from unexpected end
    @command_lines = @input.readlines.reverse if @input.exist?
    rescue
    puts ALAS
  end

  # must be called before #locate_rovers
  def get_plateau_dimensions
    # get the size of the plateau from the first text line
    dimensions = next_line.split.map { |num| num.to_i }
    Plateau.instance.breadth = dimensions.first
    Plateau.instance.length = dimensions.last
  end

  def locate_rovers
    (@command_lines.count / 2).times.map do
      location = next_line.split.map
      commands = next_line.split('').map
      # use the * (splat) operator to convert the array into a list of args
      @rovers.merge! link_to_rover(*location) => commands
    end unless @command_lines.count.odd? # extra security 
  end

  def map_plateau
    @rovers.each do |rover, commands|
      commands.each do |instruction|
        command_rover(rover, instruction)
      end
    end
  end

  def write_output
    output_file = @output.open('w') do |file|
      rovers.each_key { |rover| file.puts rover.location }
    end
  end

  private
  def command_rover(rover, instruction)
    case instruction
    when 'M'
      rover.move_forward
    when 'L'
      rover.turn_left
    when 'R'
      rover.turn_right
    else
      puts "Invalid command."
    end
  end

  def link_to_rover(x_value, y_value, heading)
    # (x, y) coordinates will be passed as a string so to_i is called
    position = Position.new(x_value.to_i, y_value.to_i)
    orientation = DIRECTIONS.key(heading)
    Rover.new(orientation, position)
  end

  def next_line
    @command_lines.pop.strip
    rescue
    puts ALAS
  end
end
