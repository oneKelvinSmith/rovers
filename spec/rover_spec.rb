require 'spec_helper'
require 'rover'

describe Rover do
  before do
    @position = Position.new(5, 5)
    @rover = Rover.new(:north, @position)
  end

  subject { @rover }

  it { should respond_to(:orientation) }
  it { should respond_to(:position) }
  it { should respond_to(:turn_right) }
  it { should respond_to(:turn_left) }
  it { should respond_to(:move_forward) }
  it { should respond_to(:location) }

  it { should be_valid }

  describe "#turn_right" do
    describe "when facing north" do
      before { @rover.orientation = :north }
      it "should face east" do
        @rover.turn_right
        @rover.orientation.should be :east
      end
    end

    describe "when facing east" do
      before { @rover.orientation = :east }
      it "should face south" do
        @rover.turn_right
        @rover.orientation.should be :south
      end
    end

    describe "when facing south" do
      before { @rover.orientation = :south }
      it "should face west" do
        @rover.turn_right
        @rover.orientation.should be :west
      end
    end

    describe "when facing west" do
      before { @rover.orientation = :west }
      it "should face north" do
        @rover.turn_right
        @rover.orientation.should be :north
      end
    end
  end

  describe "#turn_left" do
    before { @rover.orientation = :north }
    describe "when facing north" do
      it "should face west" do
        @rover.turn_left
        @rover.orientation.should be :west
      end
    end

    describe "when facing west" do
      before { @rover.orientation = :west }
      it "should face south" do
        @rover.turn_left
        @rover.orientation.should be :south
      end
    end

    describe "when facing south" do
      before { @rover.orientation = :south }
      it "should face east" do
        @rover.turn_left
        @rover.orientation.should be :east
      end
    end

    describe "when facing east" do
      before { @rover.orientation = :east }
      it "should face north" do
        @rover.turn_left
        @rover.orientation.should be :north
      end
    end
  end

  describe "when given a nil orientation" do
    it "should face north" do
      @rover.orientation = nil
      @rover.orientation.should be :north
    end
  end

  describe "when given an invalid orientation" do
    it "should face north" do
      @rover.orientation = "Madness"
      @rover.orientation.should be :north
    end
  end

  describe "#move_forward" do
    describe "when facing north" do
      before do
        @rover.orientation = :north
      end
      it "should increment the y_coordinate by 1" do
        @rover.move_forward
        @rover.position.y_coordinate.should be 6
      end
    end

    describe "when facing south" do
      before do
        @rover.orientation = :south
      end
      it "should decrement the y_coordinate by 1" do
        @rover.move_forward
        @rover.position.y_coordinate.should be 4
      end
    end

    describe "when facing east" do
      before do
        @rover.orientation = :east
      end
      it "should increment the x_coordinate by 1" do
        @rover.move_forward
        @rover.position.x_coordinate.should be 6
      end
    end

    describe "when facing west" do
      before do
        @rover.orientation = :west
      end
      it "should decrement the x_coordinate by 1" do
        @rover.move_forward
        @rover.position.x_coordinate.should be 4
      end
    end
  end
end
