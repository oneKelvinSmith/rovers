require 'spec_helper'
require 'rovers/rover_command'

describe RoverCommand do
  before do
    @rover_command = RoverCommand.new
  end

  subject { @rover_command }

  it { should respond_to(:input) }
  it { should respond_to(:output) }
  it { should respond_to(:command_lines) }
  it { should respond_to(:rovers) }
  it { should respond_to(:read_input) }
  it { should respond_to(:get_plateau_dimensions) }
  it { should respond_to(:locate_rovers) }
  it { should respond_to(:map_plateau) }
  it { should respond_to(:write_output) }

  describe "#read_input" do
    
  end
end
