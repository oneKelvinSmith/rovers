require 'spec_helper'
require 'rovers/rover_command'

describe RoverCommand do
  before do
    @rover_command = RoverCommand.new
    @rover_command.input = Pathname("spec/fixtures/input.txt")
    @rover_command.output = Pathname("spec/fixtures/output.txt")
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
    let(:expected_command_lines) do
      ["MMRMMRMRRM\n", "3 3 E\n", "LMLMLMLMM\n", "1 2 N\n", "5 5\n"]
    end
    it "should have the expected command lines" do
      @rover_command.read_input
      expect(@rover_command.command_lines).to eq expected_command_lines
    end
  end

  describe "#get_plateau_dimensions" do
    let(:expected_dimension) { 5 }
    it "should get expected plateau dimensions" do
      @rover_command.read_input
      @rover_command.get_plateau_dimensions
      Plateau.instance.length.should be expected_dimension
      Plateau.instance.breadth.should be expected_dimension
    end
  end

  describe "#locate_rovers" do
    describe "when command line count is odd" do
      before { @rover_command.command_lines = ["LMR", "LMR", "LMR"] }
      it { @rover_command.locate_rovers.should be nil }
    end

    describe "when given the test input" do
      let(:expected_rovers) do
        [Rover.new(:north, Position.new(1, 2)), Rover.new(:east, Position.new(3, 3))]
      end
      before do
        @rover_command.read_input
        @rover_command.get_plateau_dimensions
        @rover_command.locate_rovers
      end
      it "should have two rovers with expected orientation" do
        @rover_command.rovers.keys.first.orientation.should be expected_rovers.first.orientation
        @rover_command.rovers.keys.last.orientation.should be expected_rovers.last.orientation
        end
      it "should have two rovers with expected positions" do
        expect(@rover_command.rovers.keys.first.position.to_s).to eq expected_rovers.first.position.to_s
        expect(@rover_command.rovers.keys.last.position.to_s).to eq expected_rovers.last.position.to_s
      end
      it "should have two rovers with expected location strings" do
        expect(@rover_command.rovers.keys.first.location).to eq expected_rovers.first.location
        expect(@rover_command.rovers.keys.last.location).to eq expected_rovers.last.location
      end
    end
  end

  describe "#map_plateau" do
    before do
      @rover_command.read_input
      @rover_command.get_plateau_dimensions
      @rover_command.locate_rovers
    end

    describe "when given the test input"do
      let(:expected_rovers) do
        [Rover.new(:north, Position.new(1, 3)), Rover.new(:east, Position.new(5, 1))]
      end
      before do
        @rover_command.map_plateau
      end
      it "should have two rovers with expected orientation" do
        @rover_command.rovers.keys.first.orientation.should be expected_rovers.first.orientation
        @rover_command.rovers.keys.last.orientation.should be expected_rovers.last.orientation
      end
      it "should have two rovers with expected positions" do
        expect(@rover_command.rovers.keys.first.position.to_s).to eq expected_rovers.first.position.to_s
        expect(@rover_command.rovers.keys.last.position.to_s).to eq expected_rovers.last.position.to_s
      end
      it "should have two rovers with expected location strings" do
        expect(@rover_command.rovers.keys.first.location).to eq expected_rovers.first.location
        expect(@rover_command.rovers.keys.last.location).to eq expected_rovers.last.location
      end
    end

    describe "when movement instructions are invalid" do
      let(:expected_rovers) do
        [Rover.new(:north, Position.new(1, 2)), Rover.new(:east, Position.new(3, 3))]
      end
      before do
        @rover_command.rovers.keys.each do |key|
          @rover_command.rovers[key] = 'invalid'.split('').map
        end
      end
      it "should have two rovers with expected orientation" do
        @rover_command.rovers.keys.first.orientation.should be expected_rovers.first.orientation
        @rover_command.rovers.keys.last.orientation.should be expected_rovers.last.orientation
        end
      it "should have two rovers with expected positions" do
        expect(@rover_command.rovers.keys.first.position.to_s).to eq expected_rovers.first.position.to_s
        expect(@rover_command.rovers.keys.last.position.to_s).to eq expected_rovers.last.position.to_s
      end
      it "should have two rovers with expected location strings" do
        expect(@rover_command.rovers.keys.first.location).to eq expected_rovers.first.location
        expect(@rover_command.rovers.keys.last.location).to eq expected_rovers.last.location
      end
    end
  end

  describe "#write_output when given the test input" do
    before do
      @rover_command.read_input
      @rover_command.get_plateau_dimensions
      @rover_command.locate_rovers
      @rover_command.map_plateau
    end
    let(:expected_output) { "1 3 N\n5 1 E\n" }
    it "should be have the expected output" do
      @rover_command.write_output
      expect(File.open("spec/fixtures/output.txt", 'r').read).to eq expected_output
    end
  end
end
