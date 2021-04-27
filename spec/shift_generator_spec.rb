require 'rspec'
require 'date'
require './lib/shift_generator'
require './lib/key_generator'
require './lib/offset_generator'

RSpec.describe ShiftGenerator do
  it 'exists' do
    shift_generator = ShiftGenerator.new
    expect(shift_generator).to be_an_instance_of(ShiftGenerator)
  end

  it 'receives keys' do
    shift_generator = ShiftGenerator.new
    key_generator = KeyGenerator.new
    key_generator.generate_keys_from_args("02715")
    keys_generated = key_generator.keys_generated
    shift_generator.receive_keys(keys_generated)
    expected = {
                :a => 2, :b => 27,:c => 71, :d => 15
               }
    expect(shift_generator.keys).to eq(expected)
  end

  it 'receives offsets' do
    shift_generator = ShiftGenerator.new
    offset_generator = OffsetGenerator.new
    offset_generator.generate_offsets_from_args("040895")
    offsets_generated = offset_generator.offsets_generated
    shift_generator.receive_offsets(offsets_generated)
    expected = {
                :a => 1, :b => 0, :c => 2, :d => 5
               }
    expect(shift_generator.offsets).to eq(expected)
  end

end
