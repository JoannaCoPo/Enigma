require 'rspec'
require 'date'
require './lib/shift'


RSpec.describe Shift do
  it 'exists' do
    shift = Shift.new
    expect(shift).to be_an_instance_of(Shift)
  end

  it 'has numbers to form random code' do
    shift = Shift.new
    expected = [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(shift.numbers).to eq(expected)
  end

  it 'can create 5-digit key' do
    shift = Shift.new
    require "pry"; binding.pry
    shift.generate_keys
    expect(shift.key.length).to eq(5)
    # shift = double()
    # allow(shift).to receive(:key).and_return(02715) #is this how to stub?
    # require "pry"; binding.pry
    # expect(shift.key).to eq(02715)
  end

  xit 'has todays date' do
    allow(Date).to receive(:today).and_return(Date.new(2021,4,23))
    shift = Shift.new
    expect(shift.date).to eq("230421")
  end

  xit 'generates keys' do
    shift = Shift.new
    # # key1 = double() #stub
    # # allow(key1).to receive(:key).and_return(02715)
    # shift = double() #mock
    # expect(shift).to receive(:generate_keys).with(02715)
    # shift
    expect(shift.generate_keys).to be_an_instance_of(Hash)
    key1 = double() #stub
    allow(key1).to receive(:key).and_return(02715)
    shift1 = double()
    allow(shift1).to receive(:generate_keys).with(key1)
    expected = {:a=>[0, 2], :b=>[2, 7], :c=>[7, 1], :d=>[1, 5]}
    expect(shift1).to eq(expected)
  end
end
