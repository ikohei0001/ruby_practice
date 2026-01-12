require_relative "../lib/problem6.rb"

RSpec.describe "#divisors_using_sqrt" do
    describe "divisors_using_sqrt works" do
      it "returns all divisors of a normal number in ascending order" do
        expect(divisors_using_sqrt(10)).to eq([1, 2, 5, 10])
      end
      
      it "returns 1 and itself for a prime number" do
        expect(divisors_using_sqrt(13)).to eq([1, 13])
      end
    
      it "can deal with perfect square numbers" do
        expect(divisors_using_sqrt(4)).to eq([1, 2, 4])
      end
    end
end