require 'rspec'
require 'date'
require './lib/shift'


RSpec.describe Shift do
  it 'exists' do
    shift = Shift.new
    expect(shift).to be_an_instance_of(Shift)
  end

  #ATTRIBUTES(key_used, date_used, shifts)

  it 'has numbers to form random code' do
    shift = Shift.new
    expected = [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(shift.numbers).to eq(expected)
  end

  it 'can create 5-digit key' do
    shift = Shift.new
    expect(shift.create_random_number.length).to eq(5)
    # shift = double()
    # allow(shift).to receive(:key).and_return(02715) #is this how to stub?
    # expect(shift.key).to eq(02715)
  end

  xit 'has todays date' do
    allow(Date).to receive(:today).and_return(Date.new(2021,4,23))
    shift = Shift.new
    expect(shift.date).to eq("230421")
  end

  it 'generates keys' do
    shift = Shift.new
    # expect(shift.generate_keys).to be_an_instance_of(Hash)
    # key1 = double() #stub
    # allow(key1).to receive(:key).and_return(02715)
    # shift = double()
    # allow(shift).to receive(:create_random_number).with(32751)
    expect(shift.generate_keys).to be_an_instance_of(Hash)
    # expected = {:a=>[0, 2], :b=>[2, 7], :c=>[7, 1], :d=>[1, 5]}
    # expect(shift1).to eq(expected)
  end

  it 'stores key used in encryption' do
    shift = Shift.new
    expected = shift.generate_keys.values
    expect(shift.key_used).to eq(expected)
  end

  it 'stores date used in encryption' do
    shift = Shift.new
    shift.generate_shifts
    expect(shift.date_used).to be_an_instance_of(String) #need better assertion
  end

  it 'stores shift collection used in encryption' do
    shift = Shift.new
    expected = shift.generate_shifts
    expect(shift.shifts).to eq(expected)
  end
end
