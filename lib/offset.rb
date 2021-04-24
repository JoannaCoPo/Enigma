require 'date'
class Offset
  attr_reader :shifts

  def initialize(key, date)
    @key = key
    @date = date
  end

  def shifts
    keys = generate_keys
    offsets = generate_offsets
    #hash adding the keys of below 
  end

  def generate_keys
    {
      a: @key.slice(0, 2),
      b: @key.slice(1, 2),
      c: @key.slice(2, 2),
      b: @key.slice(3, 2),
    }
    # return object of key slplit up/slicing up string
    #hash
  end

  def generate_offsets
    num = @date.to_i ** 2
    #get last 4 didgits (to_s and slice)
    {
      a: num.slice(0, 1),
      b: num.slice(1, 1),
      c: num.slice(2, 1),
      b: num.slice(3, 1),
    }
  end







end



# Consider the date formatted as a number, DDMMYY.
# If the date is August 4, 1995, it would be represented
# as 040895.
# Square the numeric form (1672401025)
# Take the last four digits (1025)
# A offset: The first digit (1)
# B offset: The second digit (0)
# C offset: The third digit (2)
# D offset: The fourth digit (5)
