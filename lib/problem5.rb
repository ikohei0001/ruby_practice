class Person
  attr_reader :name, :age

  def initialize(name, age)
    raise ArgumentError, 'Must be your name' unless name.is_a?(String)
    raise ArgumentError, 'Must be your age' unless age.is_a?(Integer) && age > 0
    @name = name
    @age  = age
  end

  def greeting
    "Hello, my name is #{@name} and I'm #{@age} years old."
  end

  def age_next_year
    @age + 1
  end
end
