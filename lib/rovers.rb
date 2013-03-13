#!/usr/bin/env ruby

require_relative "rovers/version"

module Rovers
  require_relative "rovers/plateau"
  require_relative "rovers/position"
  require_relative "rovers/rover"
  require_relative "rovers/rover_command"
  require_relative "cardinal/direction"

  rover_command = RoverCommand.new

  rover_command.read_input
  rover_command.get_plateau_dimensions
  rover_command.locate_rovers
  rover_command.map_plateau
  rover_command.write_output
end
