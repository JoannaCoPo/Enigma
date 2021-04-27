require 'date'
class KeyGenerator
  attr_reader :key_used,
              :keys_generated

  def initialize
    @key_used = nil
    @keys_generated = nil
  end

  def numbers
    Array.new(10) { |number| number }
  end

  def create_random_number
    numbers.sample(5).join    
  end

  def generate_keys
    number = key_used
    key_collection = {
                      a: number.slice(0, 2),
                      b: number.slice(1, 2),
                      c: number.slice(2, 2),
                      d: number.slice(3, 2)
                     }
    @keys_generated = key_collection.transform_values(&:to_i)
  end

  def generate_keys_from_args(key)
    number = key
    key_collection = {
                      a: number.slice(0, 2),
                      b: number.slice(1, 2),
                      c: number.slice(2, 2),
                      d: number.slice(3, 2)
                     }
    @keys_generated = key_collection.transform_values(&:to_i)
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
