require 'spec_helper'
require 'rover'

describe Rover do
  before do
    @rover = Rover.new('N', 1, 1)
  end

  subject { @rover }

  it { should respond_to(:turn_right) }
  it { should respond_to(:turn_left) }
  it { should respond_to(:move_forward) }
  it { should respond_to(:location?) }

  it { should be_valid }

end
