require 'rspec'
require './lib/key_generator'


RSpec.describe KeyGenerator do
  it 'exists' do
    key_generator = KeyGenerator.new
    expect(key_generator).to be_an_instance_of(KeyGenerator)
  end

  it 'has a numbers collection to generate random number' do
    key_generator = KeyGenerator.new
    expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(key_generator.numbers).to eq(expected)
  end

  it 'generates random number' do
    key_generator = KeyGenerator.new
    random_number = key_generator.create_random_number
    expect(random_number.length).to eq(5)
  end

  it 'stores random number as key for encryption' do
    key_generator = KeyGenerator.new
    random_number = key_generator.create_random_number
    expect(key_generator.key_used.length).to eq(5)
  end

  it 'generates keys with random number key' do
    key_generator = KeyGenerator.new
    key_generator.create_random_number
    expect(key_generator.generate_keys).to be_an_instance_of(Hash)
    expect(key_generator.generate_keys.values.length).to eq(4)
  end

  it 'generates keys with key number provided' do
    key_generator = KeyGenerator.new
    expected = {
                :a=>2, :b=>27,
                :c=>71, :d=>15
               }
    expect(key_generator.generate_keys_from_args("02715")).to be_an_instance_of(Hash)
    expect(key_generator.generate_keys_from_args("02715")).to eq(expected)
  end
end
