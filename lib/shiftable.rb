require 'date'
module Shiftable

  def numbers
    Array.new(10) { |number| number }
  end

  def create_random_number
    x = numbers.sample(5).join
    x
  end

  def random_key_used
    create_random_number
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
    # @key_used = number
    # freeze #this is silly but I want this RV
  end

  def key_used
    generate_keys
    number
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def offset_helper
    # date = Date.today.strftime("%d%m%y")
    # @date_used = date
    date = todays_date
    date_squared = date.to_i ** 2
    string = date_squared.to_s
    string.slice(-4, 4)
  end

  def generate_offsets
    offset = offset_helper
    offset_collection = {
                          a: offset[0],
                          b: offset[1],
                          c: offset[2],
                          d: offset[3]
                          # a: offset.slice(0, 2),
                          # b: offset.slice(1, 2),
                          # c: offset.slice(2, 2),
                          # d: offset.slice(3, 2)
                        }
    freeze = offset_collection.transform_values(&:to_i)
  end

  def generate_shifts
    keys = generate_keys
    offsets = generate_offsets
    # @final_shifts =
                    {
                      a: keys[:a] + offsets[:a],
                      b: keys[:b] + offsets[:b],
                      c: keys[:c] + offsets[:c],
                      d: keys[:d] + offsets[:d]
                    }
  end

# => when key and date are include
  def generate_shifts_from_args(key, date)
    keys = generate_keys_from_args(key)
    offsets = generate_offsets_from_args(date)
    # @final_shifts =
                    {
                      a: keys[:a] + offsets[:a],
                      b: keys[:b] + offsets[:b],
                      c: keys[:c] + offsets[:c],
                      d: keys[:d] + offsets[:d]
                    }
  end

  def generate_keys_from_args(key)
    number = key
    key_collection = {
                      a: number.slice(0, 2),
                      b: number.slice(1, 2),
                      c: number.slice(2, 2),
                      d: number.slice(3, 2)
                     }
    freeze = key_collection.transform_values(&:to_i)
    # @key_used = number
    # freeze #this is silly but I want this RV
  end

  def generate_offsets_from_args(date)
    # require "pry"; binding.pry
    date_squared = date.to_i ** 2
    string = date_squared.to_s
    offset = string.slice(-4, 4)
    offset_collection = {
                            a: offset[0],
                            b: offset[1],
                            c: offset[2],
                            d: offset[3]
                          # a: offset.slice(0, 2),
                          # b: offset.slice(1, 2),
                          # c: offset.slice(2, 2),
                          # d: offset.slice(3, 2)
                        }
    freeze = offset_collection.transform_values(&:to_i)
  end

  #DECRYPTION
  def decrypt_shifts_from_args(key, date)
    keys = generate_keys_from_args(key)
    offsets = generate_offsets_from_args(date)
    # @final_shifts =
                    {
                      a: keys[:a] + offsets[:a],
                      b: keys[:b] + offsets[:b],
                      c: keys[:c] + offsets[:c],
                      d: keys[:d] + offsets[:d]
                    }
  end

end
