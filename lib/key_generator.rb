require 'date'
class KeyGenerator
  attr_reader :key_used,
              :date_used,
              :final_shifts

  def initialize
    @key_used = nil
    @date_used = nil
    @final_shifts = nil
  end

  def numbers
    Array.new(10) { |number| number }
  end

  def create_random_number
    random = numbers.sample(5).join
    @key_used = random
  end

  def generate_keys
    number = key_used
    key_collection = {
                      a: number.slice(0, 2),
                      b: number.slice(1, 2),
                      c: number.slice(2, 2),
                      d: number.slice(3, 2)
                     }
    freeze = key_collection.transform_values(&:to_i)
  end

  def generate_keys_from_args(key)
    number = key
    key_collection = {
                      a: number.slice(0, 2),
                      b: number.slice(1, 2),
                      c: number.slice(2, 2),
                      d: number.slice(3, 2)
                     }
    key_collection.transform_values(&:to_i)
  end



  # #DECRYPTION
  # def decrypt_shifts_from_args(key, date)
  #   keys = generate_keys_from_args(key)
  #   offsets = generate_offsets_from_args(date)
  #   # @final_shifts =
  #                   {
  #                     a: keys[:a] + offsets[:a],
  #                     b: keys[:b] + offsets[:b],
  #                     c: keys[:c] + offsets[:c],
  #                     d: keys[:d] + offsets[:d]
  #                   }
  # end

end
