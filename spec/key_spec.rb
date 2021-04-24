require 'rspec'
require './lib/key'


RSpec.describe Key do
  it 'exists' do
    key = Key.new
    expect(key).to be_an_instance_of(Key)
  end

  it 'has numbers to form random code' do
    key = Key.new
    expected = [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(key.numbers).to eq(expected)
  end

  it 'can create 5-digit key' do
    key = Key.new
    expect(key.keys.length).to eq(5)
  end
end
