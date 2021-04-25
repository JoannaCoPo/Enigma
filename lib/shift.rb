require 'date'
class Shift
  attr_reader :key,
              :date,
              :shifts

  def initialize #(key, date)
    @key = numbers.sample(5).to_s
    @date = Date.today.strftime("%d%m%y")
  end

  def shifts
    keys = generate_keys
    offsets = generate_offsets
    #hash adding the keys of below
  end

  def generate_keys
    key_collection = {
                      a: @key.slice(0, 2),
                      b: @key.slice(1, 2),
                      c: @key.slice(2, 2),
                      d: @key.slice(3, 2)
                    }
    key_collection.transform_values(&:to_i)
  end

  def generate_offsets
    offset = offset_helper
    offset_collection = {
                          a: offset.slice(0, 2),
                          b: offset.slice(1, 2),
                          c: offset.slice(2, 2),
                          d: offset.slice(3, 2)
                        }
    offset_collection.transform_values(&:to_i)
  end

  def offset_helper
    date_squared = @date.to_i ** 2
    string = date_squared.to_s
    string.slice(-4, 4)
  end

  def generate_shift
    #something like:
    shift = []
    generate_keys.each do |key|
      generate_offsets.each do |offset|
        key + offset if key == offset
      end
    end
  end

  def numbers
    Array.new(10) { |number| number }
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
