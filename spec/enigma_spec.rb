require 'rspec'
require './lib/enigma'
require './lib/shift'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'can add shifts collection' do
    enigma = Enigma.new
    shift1 = Shift.new
    shift1.generate_shifts
    enigma.add_shifts(shift1)
    expect(enigma.shifts).to eq(shift1)
  end

  it 'has tools for encryption' do
    enigma = Enigma.new
    shift1 = Shift.new
    shift1.generate_shifts
    enigma.add_shifts(shift1)
    expect(enigma.key_string).to be_an_instance_of(String)
    expect(enigma.key_string.length).to eq(5)
    expect(enigma.date_string).to be_an_instance_of(String)
    expect(enigma.date_string.length).to eq(6)
  end

  xit 'has a character set' do
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r",
                "s", "t", "u", "v", "w", "x", "y", "z", " "]
    expect(enigma.alphabet).to eq(expected)
  end

  it 'has locations for characters in set' do
    enigma = Enigma.new
    expected = {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5,
                "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11,
                "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17,
                "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23,
                "y"=>24, "z"=>25, " "=>26}
    expect(enigma.character_location).to eq(expected)
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
    enigma = Enigma.new
    shift1 = Shift.new
    shift1.generate_shifts
    enigma.add_shifts(shift1)
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

#HELPERS TO TEST
