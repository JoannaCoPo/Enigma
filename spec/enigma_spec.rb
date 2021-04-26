require 'rspec'
require './lib/enigma'
require './lib/shift'
require './lib/message'

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

  # it 'can add a message to encrypt' do
  #   enigma = Enigma.new
  #   message1 = Message.new("Hello World")
  #   enigma.add_message(message1)
  #   expect(enigma.original_message).to eq("Hello World")
  # end

  # it 'has tools for encryption' do
  #   enigma = Enigma.new
  #   shift1 = Shift.new
  #   shift1.generate_shifts
  #   enigma.add_shifts(shift1)
  #   expect(enigma.key_string).to be_an_instance_of(String)
  #   expect(enigma.key_string.length).to eq(5)
  #   expect(enigma.date_string).to be_an_instance_of(String)
  #   expect(enigma.date_string.length).to eq(6)
  # end

  it 'has a character set' do
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r",
                "s", "t", "u", "v", "w", "x", "y", "z", " "]
    expect(enigma.alphabet).to eq(expected)
  end

  it 'can access the final shifts for encryption' do
    enigma = Enigma.new
    shift1 = Shift.new
    shift1.generate_shifts
    enigma.add_shifts(shift1)
    expect(enigma.encryption_shifts).to eq(shift1.final_shifts)
  end

  xit 'separates messages letters and preps for lowercase translation' do
    enigma = Enigma.new
    message1 = Message.new("Hello World")
    enigma.add_message(message1)
    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    expect(enigma.message_to_array).to eq(expected)
  end

  xit 'it encrypts message' do
    enigma = Enigma.new
    shift1 = Shift.new
    message1 = Message.new("Hello World")
    shift1.generate_shifts
    enigma.add_shifts(shift1)
    enigma.add_message(message1)
    enigma.encrypt_strings
    expect(enigma.encrypted_strings.length).to eq(11)
  end

  xit 'it returns encrypted charters to one string' do
    enigma = Enigma.new
    shift1 = Shift.new
    message1 = Message.new("Hello World")
    shift1.generate_shifts
    enigma.add_shifts(shift1)
    enigma.add_message(message1)
    enigma.encrypt_strings
    expect(enigma.join_strings).to be_an_instance_of(String)
    expect(enigma.join_strings.length).to eq(11)
  end

  it 'it encrypts message' do
    enigma = Enigma.new
    shift1 = Shift.new
    message1 = Message.new("Hello World")
    message_string = message1.message_to_encrypt
    # key = enigma.key_string
    # date = enigma.date_string
    shift1.generate_shifts
    enigma.add_shifts(shift1)
    # enigma.add_message(message1)
    # enigma.encrypt_strings
    expected =  {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
      require "pry"; binding.pry
      expect(enigma.encrypt(message_string).length).to eq(11)
    # expect(enigma.encrypt(message_string, "02715", "040895")).to eq(expected)
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
