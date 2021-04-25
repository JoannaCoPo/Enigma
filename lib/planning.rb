# make work with all args, then make
# work witout date then without date
def encrypt(message, key = nil, date = Date.today.strftime("%d%m%y").to_i)
  @original_message = message
  encrypted_string =
  {
    encryption: encrypted_message,
    key: key,
    date: date
  }
end


def encrypted_string
  @original_message #string
  encryption_shifts #hash
  alphabet.rotate(SHIFT)[ORIGINAL INDEX]
end

def alphabet
  ("a".."z").to_a << " "
end

# def character_location
  alphabet.each_with_object({}) {|key, value| value[key] = alphabet.index(key)}
# end

def encrypt_helper1
  array = @original_message.split(//)
  array.map.with_index do |letter, index|
    # index % 4 == 0 ? letter.SHIFT_ROTATION : letter
  end
end


def final_shift_integers
  @shifts.final_shifts.values
end

def shift_a_rotate
  a = final_shift_integers[0]
  alphabet.rotate()
end

def shift_b
end

def shift_c
end

def shift_d

end

# FINAL SHIFTS
#   A: 3
#   B: 27
#   C: 73
#   D: 20
#   message -  "H e  l  l  o    W  o  r l  d"
#               A B  C  D  A  B C  D  A B  C
#               3 27 73 20 3 27 73 20 3 27 73
#['a', 'b'].each_with_object({}) { |k, h| h[k] = k.upcase }
# a = ("a".."z").to_a << " "
#
# def shift_a
#   3
# end
#
# def shift_b
#   27
# end
#
# def shift_c
#   73
# end
#
# def shift_d
#   20
# end
#
# p a.rotate(0)[4]
