require 'spec_helper'

describe Plateau do
  before do
    @plateau = Plateau.new(length: 10, breadth: 10)
  end

  it { should respond_to(length) }
  it { should respond_to(breadth) }

  it { should be_valid }

  describe "when the length is zero" do
    before { @plateau.length = 0 }
    it {  should_not be_valid }
  end

  describe "when the breadth is zero" do
    before { @plateau.breadth = 0 }
    it {  should_not be_valid }
  end

  describe "when the length is negative" do
    before { @plateau.length = -1 }
    it {  should_not be_valid }
  end

  describe "when the breadth is negative" do
    before { @plateau.breadth = -1 }
    it {  should_not be_valid }
  end

  describe "when the dimensions are out of bounds" do
    let { :upper_bound = 100 }

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
end
