require_relative '../lib/problem5.rb'

RSpec.describe Person do
  let(:alice) { Person.new('Alice', 25) }

  describe 'initialization' do
    it 'initializes with correct name and age' do
      expect(alice.name).to eq('Alice')
      expect(alice.age).to eq(25)
    end

    it 'initializes with new correct name and age' do
      bob = Person.new('Bob', 30)
      expect(bob.name).to eq('Bob')
      expect(bob.age).to eq(30)
    end
  end

  describe 'argument validation' do
    it 'raises ArgumentError when name is not a string' do
      expect { Person.new(12, 25) }.to raise_error(ArgumentError, "Must be your name")
    end

    it 'raises ArgumentError when age is not a positive integer' do
      expect { Person.new('John', 'age') }.to raise_error(ArgumentError, "Must be your age")
      expect { Person.new('John', 0) }.to raise_error(ArgumentError, "Must be your age")
    end
  end

  describe 'instance methods' do
    it 'greeting works' do
      expect(alice.greeting).to eq("Hello, my name is Alice and I'm 25 years old.")
    end

    it 'age_next_year works' do
      expect(alice.age_next_year).to eq(26)
    end
  end
end
