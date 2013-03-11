require 'spec_helper.rb'

describe Rover do
  before do
    @rover = Rover.new(orientation: 'N', position: Position.new(x_coordinate: 1, y_coordinate: 1))
  end

  it { should respond_to(orientation) }
  it { should respond_to(position) }
  it { should respond_to(turn_right) }
  it { should respond_to(turn_left) }
  it { should respond_to(move_forward) }
  it { should respond_to(location?) }

  it { should be_valid }

  

end
