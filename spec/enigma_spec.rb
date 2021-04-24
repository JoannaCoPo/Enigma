require 'rspec'
require './lib/enigma'
require './lib/message'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an_instance_of(Enigma)
  end

  # it 'has attributes' do
  #   enigma = Enigma.new
  # end

  it 'receives message to encrypt' do
    enigma = Enigma.new
    message = Message.new("Hello World")
    # algorithm = Algorithm.new("Hello World")
    enigma.receive_message(message)
    expect(enigma.original_message).to eq("Hello World")
  end

  xit 'has a character set' do
    enigma = Enigma.new
    algorithm = Algorithm.new("Hello World")
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


  xit 'it encrypts' do                  #returns hash
    enigma = Enigma.new
    algorithm = Algorithm.new("Hello World")
    #MESSAGE + optional arg(key and date)
    #if no key == optional, generate random key
    #if no date == optional, if none given - use today's day
    expected = {encryption: "encrypted string",
                           key: "00000",
                          date: "DDMMYY"}
    expect(enigma.encrypt(message)).to eq(expected)
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
