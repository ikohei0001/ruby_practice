require_relative "../lib/problem8.rb"

RSpec.describe "calculate_status" do
  describe "#calculate_mean" do
    context "with valid values" do
      it "returns the correct mean for an integer array" do
        expect(calculate_mean([1, 4, 4])).to eq(3)
      end

      it "returns the correct mean for negative and zero values" do
        expect(calculate_mean([-1, 0, 1])).to eq(0)
        expect(calculate_mean([-5, 0, -10])).to eq(-5)
      end

      it "returns the correct mean for an array with one element" do
        expect(calculate_mean([42])).to eq(42)
      end

      it "returns the mean approximately for floating point values" do
        expect(calculate_mean([1.222, 1.4444, 1.666])).to be_within(0.001).of(1.444)
      end
    end

    context "with invalid values" do
      it "raises an error for an array containing non-numeric elements" do
        expect { calculate_mean([1, "a", 5]) }.to raise_error(ArgumentError)
      end

      it "raises an error for an empty array" do
        expect { calculate_mean([]) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#calculate_standard_deviation" do
    context "with valid values" do
      it "returns the correct std for an integer array" do
        expect(calculate_standard_deviation([2, 4, 4, 4, 5, 5, 7, 9])).to eq(2)
      end

      it "returns the correct std for negative values" do
        expect(calculate_standard_deviation([-4, -4, 4, 4])).to eq(4)
      end

      it "returns the correct std for an array with one element" do
        expect(calculate_standard_deviation([42])).to eq(0)
      end

      it "returns the std approximately for an array containing zero" do
        expect(calculate_standard_deviation([0.0, 1.5, 2.5, 3.5])).to be_within(0.01).of(1.29)
      end
    end

    context "with invalid values" do
      it "raises an error for an array containing non-numeric elements" do
        expect { calculate_standard_deviation([1, "a", 5]) }.to raise_error(ArgumentError)
      end

      it "raises an error for an empty array" do
        expect { calculate_standard_deviation([]) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#calculate_median" do
    context "with valid values" do
      it "returns the correct median for an integer array" do
        expect(calculate_median([4, 2, 6])).to eq(4)
      end

      it "returns the correct median for negative, zero, and decimal values" do
        expect(calculate_median([0, -1, 6, 1.555, 10])).to be_within(0.0001).of(1.555)
      end

      it "returns the correct median for an even-length array" do
        expect(calculate_median([1, 3, 5, 7])).to eq(4)
      end

      it "returns the correct median for an array with one element" do
        expect(calculate_median([42])).to eq(42)
      end
    end

    context "with invalid values" do
      it "raises an error for an empty array" do
        expect { calculate_median([]) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#calculate_mode" do
    context "with valid values" do
      it "returns the correct mode for an integer array" do
        expect(calculate_mode([1, 4, 4, 2])).to eq([4])
      end

      it "returns the correct mode for negative, zero, and decimal values" do
        modes = calculate_mode([0, -1.1112, 6, 1.5, 10, -1.1112])
        expect(modes.size).to eq(1)
        expect(modes.first).to be_within(0.001).of(-1.1112)
      end

      it "returns all correct modes if there is more than one" do
        expect(calculate_mode([0, 0, 1, 1, 5, -1]).sort).to eq([0, 1])
      end

      it "returns the correct mode for an array with one element" do
        expect(calculate_mode([42])).to eq([42])
      end
    end

    context "with invalid values" do
      it "raises an error for an empty array" do
        expect { calculate_mode([]) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#calculate_status" do
    it "returns the correct status for an array containing values" do
      result = calculate_status([1, 1, 3, 4, 5])

      expect(result[:mean]).to eq(2.8)
      expect(result[:standard_deviation]).to eq(1.6)
      expect(result[:median]).to eq(3)
      expect(result[:mode]).to eq([1])
    end
  end
end