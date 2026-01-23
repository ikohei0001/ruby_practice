require_relative "../lib/problem9.rb"

RSpec.describe "#custom_sort" do
  context "when given an array of words" do
    it "correctly sorts an array" do
      expect(custom_sort(["peach", "apple", "banana"])).to eq(["apple", "banana", "peach"])
    end

    it "places a capitalized word after its lowercase version" do
      expect(custom_sort(["Apple", "apple"])).to eq(["apple", "Apple"])
    end

    it "places an uppercase word after lowercase and capitalized words" do
      expect(custom_sort(["APPLE", "apple", "Apple"])).to eq(["apple", "Apple", "APPLE"])
    end
  end
end