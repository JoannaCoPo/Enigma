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
    expect(algorithm.key).to eq(nil)
    expect(algorithm.date).to eq(nil)
  end


end
