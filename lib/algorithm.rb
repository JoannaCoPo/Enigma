require 'date'
class Algorithm
  #potentially split into more classes (key, date, message)
  attr_reader :message,
              :alphabet,
              :key,
              :date

  def initialize(message)
    @message = message
    @alphabet = nil
    @key = nil
    @date = Date.today.strftime("%d%m%y").to_s
  end

  def create_alphabet
    @alphabet = ("a".."z").to_a << " "
  end

  def create_key
    @key = numbers.sample(5)
  end

  def numbers #find a better way for this
    [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # def create_date #date thing, Megan - IC
  #
  #   # Time.new.strftime("%d%m%y").to_s
  # end
end
