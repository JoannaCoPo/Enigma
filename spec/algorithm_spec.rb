require 'rspec'
require './lib/enigma'
require './lib/algorithm'

RSpec.describe Algorithm do
  it 'exists' do
    algorithm = Algorithm.new
    expect(algorithm).to be_an_instance_of(Algorithm)
  end

  it 'has attributes' do
    algorithm = Algorithm.new
    expect(algorithm.alphabet).to eq(nil)
    expect(algorithm.key).to eq(nil)
    expect(algorithm.date).to eq(nil)
  end

  it 'can create alphabet' do
    algorithm = Algorithm.new
    algorithm.create_alphabet
    expect(algorithm.alphabet.length).to eq(27)
  end

  it 'has a collection of numbers' do #think of better name
    algorithm = Algorithm.new         #is this an attribute
    expected = [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(algorithm.numbers).to eq(expected)
  end

  it 'can create a key' do
    algorithm = Algorithm.new
    algorithm.create_key
    expect(algorithm.key.length).to eq(5)
  end

  it 'can create a date' do
    algorithm = Algorithm.new
    date = algorithm.create_date
    expect(date).to eq("230421")
  end
end
