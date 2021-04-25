require 'date'
class Shift
  attr_reader :key_used,
              :date_used,
              :shifts

  def initialize
    @key_used = nil
    @date_used = nil
    @shifts = nil
  end

  def generate_keys
    number = create_random_number
    key_collection = {
                      a: number.slice(0, 2),
                      b: number.slice(1, 2),
                      c: number.slice(2, 2),
                      d: number.slice(3, 2)
                     }
    freeze = key_collection.transform_values(&:to_i)
    @key_used = freeze.values
    freeze #this is silly but I want this RV
  end

  def generate_offsets
    offset = offset_helper
    offset_collection = {
                          a: offset.slice(0, 2),
                          b: offset.slice(1, 2),
                          c: offset.slice(2, 2),
                          d: offset.slice(3, 2)
                        }
    freeze = offset_collection.transform_values(&:to_i)
  end

  def offset_helper
    date = Date.today.strftime("%d%m%y")
    @date_used = date
    date_squared = date.to_i ** 2
    string = date_squared.to_s
    string.slice(-4, 4)
  end

  def generate_shifts
    keys = generate_keys
    offsets = generate_offsets
    @shifts = {
                a: keys[:a] + offsets[:a],
                b: keys[:b] + offsets[:b],
                c: keys[:c] + offsets[:c],
                d: keys[:d] + offsets[:d]
              }
  end

  def numbers
    Array.new(10) { |number| number }
  end

  def create_random_number
    numbers.sample(5).join
  end


end
