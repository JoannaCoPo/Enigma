require 'rspec'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_instsance_of(Enigma)
  end

  it 'encrypts' do                  #returns hash
    enigma = Enigma.new
    #MESSAGE + optional arg(key and date)
    #if no key == optional, generate random key
    #if no date == optional, if none given - use today's day
    encrypted = {encryption: "encrypted string",
                           key: "00000",
                          date: "DDMMYY"}
    expect(enigma.encrypt(message)).to eq(encrypted)
  end

  it 'decrypts' do                  #returns hash
    enigma = Enigma.new
    #MESSAGE + optional arg(key and date)
    #if no key, generate random key
    #date == optional, if no date, use today's day
    decrypted = enigma.decrypt(ciphertext, key, date = 000000)
    expected = {decryption: "decrypted string",
                           key: "00000",
                          date: "DDMMYY}
    expect(decrypted).to eq(expected)
  end


end
