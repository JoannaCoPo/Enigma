require 'rspec'
require 'date'
require './lib/offset'


RSpec.describe Offset do
  it 'exists' do
    offset = Offset.new
    expect(offset).to be_an_instance_of(Offset)
  end

  it 'has todays date' do
    allow(Date).to receive(:today).and_return(Date.new(2021,4,23))
    offset = Offset.new
    require "pry"; binding.pry
    expect(offset.date).to eq(230421)
  end
end
