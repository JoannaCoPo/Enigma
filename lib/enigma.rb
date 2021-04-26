require 'date'
class Enigma
  attr_reader :shifts,
              :original_message

  def initialize
    @shifts = nil
    @original_message = nil
  end

  def add_shifts(shift)
    @shifts = shift
  end

  def key_string
    @shifts.key_used
  end

  def date_string
    @shifts.date_used
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def character_locations
    alphabe .each_with_object({}) {|key, value| value[key] = alphabet.index(key)}
  end

  def encryption_shifts
    @shifts.final_shifts
  end

  def final_shift_integers
    encryption_shifts.values
  end

  def message_to_array
    @original_message.split(//)
  end

#TRY MOUDLO
#alphabet[(shift + original_index) % alphabet.length]

  def replace_every_fourth ##try with just map
    message_to_array.map.with_index do |letter, index|
      index % 4 == 0 ? letter.replace("k") : letter #helper for replace(helper)
    end
  end

  def message_original_index #try with just map
    message_to_array.map.with_index do |letter, index|
      character_locations.fetch(letter)
    end #array
  end

  def message_lettes_with_original_index
    message_to_array.map.with_object({}) do |letter, h|
      indices.map do |num|
        h[letter] = num if indices.index(num) == message_to_array.index(letter)
      end
    end
  end

#opportunity for module?
  def shift_a_rotate
    a = final_shift_integers[0]
    alphabet.rotate(a)[]
  end

  def shift_b_rotate
    b = final_shift_integers[1]
  end

  def shift_c_rotate
    b = final_shift_integers[2]
  end

  def shift_d_rotate
    b = final_shift_integers[3]
  end


end
