require_relative '../lib/problem4.rb'

RSpec.describe '#reverse a string' do
  describe 'when sending a string' do
    it 'returns olleh for hello' do
      expect(reverse_a_string('hello')).to eq 'olleh'
    end
    it 'returns the same for one letter' do
      expect(reverse_a_string('a')).to eq 'a'
    end
    it 'returns empty string for empty input' do
      expect(reverse_a_string('')).to eq ''
    end
  end

  describe 'when sending a non-string value' do
    it 'raises ArgumentError' do
      expect { reverse_a_string(['one', 'two']) }.to raise_error(ArgumentError, "Must be a string")
    end
  end
end