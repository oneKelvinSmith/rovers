require 'spec_helper'
require 'plateau'

describe Plateau do
  before do
    @plateau = Plateau.instance
    @plateau.length = @plateau.breadth = 10
  end

  subject { @plateau }

  let(:min_distance) { 1 }
  let(:upper_bound) { 100 }

  it { should respond_to(:upper_bound) }
  it { should respond_to(:lower_bound) }
  it { should respond_to(:bound_by_length) }
  it { should respond_to(:bound_by_breadth) }

  it { should be_valid }

  describe "when the length is zero" do
    before { @plateau.length = 0 }
    it { should be_valid }
    it "should have the minimum length" do
      @plateau.length.should == min_distance
    end
  end

  describe "when the breadth is zero" do
    before { @plateau.breadth = 0 }
    it { should be_valid }
    it "should have the minimum breadth" do
      @plateau.breadth.should == min_distance
    end
  end

  describe "when the length is negative" do
    before { @plateau.length = -1 }
    it { should be_valid }
    it "should have the minimum breadth" do
      @plateau.breadth.should == min_distance
    end
  end

  describe "when the breadth is negative" do
    before { @plateau.breadth = -1 }
    it { should be_valid }
    it "should have the minimum breadth" do
      @plateau.breadth.should == min_distance
    end
  end

  describe "when the length is out of bounds" do
    before { @plateau.length = 999 }
    it "should be equal to the upper bound" do
      @plateau.length.should == upper_bound
    end
  end

  describe "when y_coordinate is out of bounds" do
    before { @plateau.breadth = 999 }
    it "should be equal to the upper bound" do
      @plateau.breadth.should == upper_bound
    end
  end
end
