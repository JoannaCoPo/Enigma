require 'rspec'
require 'date'
require './lib/enigma'
require './lib/algorithm'

RSpec.describe Algorithm do
  it 'exists' do
    algorithm = Algorithm.new("Hello World")
    expect(algorithm).to be_an_instance_of(Algorithm)
  end

  it 'has attributes' do
    algorithm = Algorithm.new("Hello World")
    expect(algorithm.message).to eq("Hello World")
    expect(algorithm.alphabet).to be_an_instance_of(Array) #come up with better assertion
    expect(algorithm.key).to be_an_instance_of(Array) #come up with better assertion
    expect(algorithm.date).to be_an_instance_of(String)
  end

  it 'can create alphabet' do
    algorithm = Algorithm.new("Hello World")
    expect(algorithm.alphabet.length).to eq(27)
  end

  it 'has a collection of numbers for key' do #think of better name
    algorithm = Algorithm.new("Hello World")
    expected = [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(algorithm.numbers).to eq(expected)
  end

  it 'can create a key' do
    algorithm = Algorithm.new("Hello World")
    expect(algorithm.key.length).to eq(5)
  end

  it 'can create a date' do
    allow(Date).to receive(:today).and_return(Date.new(2021,4,23))
    algorithm = Algorithm.new("Hello World")
    expect(algorithm.date).to eq("230421")
  end
end
