require 'date'
class Enigma
  attr_reader :key_string

  def initialize(shifts = nil)
    @key_string = shift.key_used.to_s
  end

  def encrypt(message, key = nil, date = Date.today.strftime("%d%m%y").to_i)
    # make work with all args, then make
    # work witout date then without date
  end

  def decrypt(message, key, date = Date.today.strftime("%d%m%y").to_i)

  end



end
