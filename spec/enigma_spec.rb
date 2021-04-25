require 'rspec'
require './lib/enigma'
require './lib/shift'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new(shifts)
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'has tools for encryption' do
    enigma = Enigma.new
    shifts = Shift.new
    shift_collection = shifts.generate_shifts
    # require "pry"; binding.pry
    expect(enigma.key_string).to be_an_instance_of(String)
  end

  xit 'has a character set' do
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r",
                "s", "t", "u", "v", "w", "x", "y", "z", " "]
    expect(enigma.alphabet).to eq(expected)
  end

  xit 'has a key for encryption' do
    enigma = Enigma.new
    algorithm = Algorithm.new("Hello World")
    #MOCK/STUB
    expect(enigma.key.length).to eq(5)
  end

  xit 'has a date for encryption' do
    enigma = Enigma.new
    algorithm = Algorithm.new("Hello World")
    expect(enigma.message).to eq("Hello World")
  end


  xit 'it encrypts' do
    enigma = Enigma.new
    shifts = Shift.new
    shifts.generate_shifts
    require "pry"; binding.pry
    expected =  {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  xit 'it decrypts' do                  #returns hash
    enigma = Enigma.new
    #MESSAGE + optional arg(key and date)
    #if no key, generate random key
    #date == optional, if no date, use today's day
    decrypted = enigma.decrypt(ciphertext, key, date = 000000)
    expected = {decryption: "decrypted string",
                key: "00000",
                date: "DDMMYY"}

    expect(decrypted).to eq(expected)
  end
end
