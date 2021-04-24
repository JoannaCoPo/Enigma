class Key
  attr_reader :keys
  
  def initialize
    @keys = numbers.sample(5)
  end

  def numbers
    Array.new(10) { |number| number }
  end
end
