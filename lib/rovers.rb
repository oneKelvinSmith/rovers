#!/usr/bin/env ruby

require "./rovers/version"

module Rovers
  require "./rovers/plateau"
  require "./rovers/position"
  require "./rovers/rover"
  require "./rovers/rover_command"
  require "./cardinal/direction"

  rover_command = RoverCommand.new

  rover_command.read_input
  rover_command.get_plateau_dimensions
  rover_command.locate_rovers
  rover_command.map_plateau
  rover_command.write_output
end
