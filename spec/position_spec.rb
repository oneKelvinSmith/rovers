require 'spec_helper'

describe Position do
  before do
    @position = Position.new(x_coordinate: 0, y_coordinate: 0)
  end

  subject{ @position }

  it { should respond_to(x_coordinate) }
  it { should respond_to(y_coordinate) }
  it { should respond_to(to_s) }

  it { should be_valid }

  describe "when x_coordinate is nil" do
    before { @position.x_coordinate = nil }
    it { should_not be_valid}
  end

  describe "when y_coordinate is nil" do
    before { @position.y_coordinate = nil }
    it { should_not be_valid}
  end

  describe "when x_coordinate is negative" do
    before { @position.x_coordinate = -1 }
    it { should_not be_valid}
  end

  describe "when y_coordinate is negative" do
    before { @position.y_coordinate = -1 }
    it { should_not be_valid}
  end

  describe "when a coordinate is out of bounds" do
    let(:upper_bound) { 100 }

    describe "when x_coordinate is out of bounds" do
      before { @position.x_coordinate = 999 }
      it "should be equal to the upper bound" do
        @position.x_coordinate.should == upper_bound
      end
    end

    describe "when y_coordinate is out of bounds" do
      before { @position.y_coordinate = 999 }
      it "should be equal to the upper bound" do
        @position.y_coordinate.should == upper_bound
      end
    end
  end
end
