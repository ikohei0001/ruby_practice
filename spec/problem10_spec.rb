require_relative "../lib/problem10.rb"

RSpec.describe RomanConverter do
   describe ".to_roman" do
       context "with valid values" do
         it "converts the minimum value" do
             expect(RomanConverter.to_roman(1)).to eq("I")
         end
         
         it "converts a subtractive single-digit number" do
             expect(RomanConverter.to_roman(4)).to eq("IV")
            expect(RomanConverter.to_roman(9)).to eq("IX")
         end
         
         it "converts an additive-only number" do
             expect(RomanConverter.to_roman(58)).to eq("LVIII")
         end
         
         it "converts a number with multiple subtractive patterns" do
            expect(RomanConverter.to_roman(1994)).to eq("MCMXCIV")
         end
         
         it "converts the maximum value" do
            expect(RomanConverter.to_roman(3999)).to eq("MMMCMXCIX")
         end
       end
        
       context "with invalid values" do
         it "raise an error for zero or negative numbers" do
            expect { RomanConverter.to_roman(0) }.to raise_error(ArgumentError)
            expect { RomanConverter.to_roman(-1) }.to raise_error(ArgumentError)
         end
         
         it "raise an error for numbers greater than 3999" do
            expect { RomanConverter.to_roman(4000) }.to raise_error(ArgumentError)
         end
         
         it "raise an error for non-integer values" do
            expect { RomanConverter.to_roman(1.2) }.to raise_error(ArgumentError)
         end
       end
   end
   
   describe ".from_roman" do
       context "with valid roman numerals" do
         it "converts a simple additive numeral" do
           expect(RomanConverter.from_roman("I")).to eq(1)
        end
         
         it "converts subtractive numerals at each digit" do
           expect(RomanConverter.from_roman("IV")).to eq(4)
           expect(RomanConverter.from_roman("IX")).to eq(9)
           expect(RomanConverter.from_roman("XL")).to eq(40)
           expect(RomanConverter.from_roman("CM")).to eq(900)
         end
      
         it "converts a numeral with mixed additive and subtractive patterns" do
           expect(RomanConverter.from_roman("MCMLXXXVIII")).to eq(1988)
         end
       end
       
      context "with invalid roman numerals" do
        it "rejects repeated numerals" do
           expect { RomanConverter.from_roman("IIII") }.to raise_error(ArgumentError)
        end

        it "rejects invalid subtractive patterns" do
           expect { RomanConverter.from_roman("IC") }.to raise_error(ArgumentError)
        end

        it "rejects empty or nil input" do
           expect { RomanConverter.from_roman("") }.to raise_error(ArgumentError)
           expect { RomanConverter.from_roman(nil) }.to raise_error(ArgumentError)
        end
      end
   end
end