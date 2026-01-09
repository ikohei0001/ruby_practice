require_relative "../lib/problem7.rb"

RSpec.describe "BMI functions" do
  describe "#calculate_bmi" do
    context "with valid values" do
      it "returns a correct bmi for a nomal value" do
        expect(calculate_bmi(170, 60)).to eq(20.76)
      end

      it "works with integer values" do
        expect(calculate_bmi(200, 100)).to eq(25.0)
      end

      it "works with decimal values" do
        expect(calculate_bmi(165.8, 60.5)).to eq(22.01)
      end

      it "rounds correctly" do
        expect(calculate_bmi(100, 22.344)).to eq(22.34)
        expect(calculate_bmi(100, 22.345)).to eq(22.35)
      end
    end

    context "with invalid values" do
      it "raises error for zero height or weight" do
        expect { calculate_bmi(0, 60) }.to raise_error(ArgumentError)
        expect { calculate_bmi(170, 0) }.to raise_error(ArgumentError)
      end

      it "raises error for negative values" do
        expect { calculate_bmi(-1, 60) }.to raise_error(ArgumentError)
        expect { calculate_bmi(170, -1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#categorize_by_bmi" do
    context "with bmi values" do
      it "categorizes representative values correctly" do
        expect(categorize_by_bmi(17)).to eq("低体重")
        expect(categorize_by_bmi(20)).to eq("普通体重")
        expect(categorize_by_bmi(28)).to eq("肥満(1度)")
        expect(categorize_by_bmi(33)).to eq("肥満(2度)")
        expect(categorize_by_bmi(38)).to eq("肥満(3度)")
        expect(categorize_by_bmi(45)).to eq("肥満(4度)")
      end

      it "categorizes border values correctly" do
        expect(categorize_by_bmi(0)).to eq("低体重")
        expect(categorize_by_bmi(18.5)).to eq("普通体重")
        expect(categorize_by_bmi(25)).to eq("肥満(1度)")
        expect(categorize_by_bmi(30)).to eq("肥満(2度)")
        expect(categorize_by_bmi(35)).to eq("肥満(3度)")
        expect(categorize_by_bmi(40)).to eq("肥満(4度)")
      end

      it "categorizes enormous values as obesity level 4" do
        expect(categorize_by_bmi(100)).to eq("肥満(4度)")
      end
    end

    context "with invalid bmi values" do
      it "raises an error for negative values" do
        expect { categorize_by_bmi(-1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#measure_bmi" do # 自作テスト
    context "with valid values" do
      it "returns the correct string with bmi and category value" do
        expect(measure_bmi(170, 53)).to eq("あなたのBMIは18.34で、低体重に分類されます")
        expect(measure_bmi(160, 70)).to eq("あなたのBMIは27.34で、肥満(1度)に分類されます")
      end
    end
  end

  describe "#measure_bmi" do # AI作テスト
    context "with valid values" do
      it "includes bmi and category in the message" do
        result = measure_bmi(170, 53)

        expect(result).to include("18.34")
        expect(result).to include("低体重")
      end
    end
  end
end