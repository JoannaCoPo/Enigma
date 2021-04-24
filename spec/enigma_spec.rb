require 'rspec'
require './lib/enigma'
require './lib/algorithm'

RSpec.describe Enigma do
  it 'exists' do
    enigma1 = Enigma.new
    expect(enigma1).to be_an_instance_of(Enigma)
  end

  xit 'has attributes' do
    enigma = Enigma.new

  end

  xit 'it encrypts' do                  #returns hash
    enigma = Enigma.new
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
