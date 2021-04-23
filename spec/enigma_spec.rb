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
    #if no key, generate random key
    #if no date, use today's day
    expected = #hash
    expect(enigma.encrypt(message)).to eq(expected)
  end


end
