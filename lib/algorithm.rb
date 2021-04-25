require 'date'
class Algorithm #potentially split into more classes (key, date, message)
  attr_reader :message,
              :alphabet,
              :key,
              :date

  def initialize(message)
    @message = message
    @alphabet = ("a".."z").to_a << " "
    @key = numbers.sample(5)
    @date = Date.today.strftime("%d%m%y").to_s
  end

  def numbers
    Array.new(10) { |number| number }
    # [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end

  # def create_alphabet
  #   @alphabet = ("a".."z").to_a << " "
  # end

  # def create_key
  #   @key = numbers.sample(5)
  # end
