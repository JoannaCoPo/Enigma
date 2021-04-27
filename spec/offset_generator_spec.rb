require 'rspec'
require './lib/offset_generator'


RSpec.describe OffsetGenerator do
  it 'exists' do
    offset_generator = OffsetGenerator.new
    expect(offset_generator).to be_an_instance_of(OffsetGenerator)
  end

  it 'does math for offset preparation' do
    allow(Date).to receive(:today).and_return(Date.new(1995,8,4))
    offset_generator = OffsetGenerator.new
    expect(offset_generator.offset_helper).to eq("1025")
  end

  it 'generates offsets without a date provided' do
    allow(Date).to receive(:today).and_return(Date.new(1995,8,4))
    offset_generator = OffsetGenerator.new
    expected = {
                :a => 1, :b => 0, :c => 2, :d => 5
               }
    expect(offset_generator.generate_offsets).to eq(expected)
  end

  it 'generates offsets with a date provided' do
    offset_generator = OffsetGenerator.new
    expected = {
                :a => 1, :b => 0, :c => 2, :d => 5
               }
    offsets = offset_generator.generate_offsets_from_args("040895")
    expect(offsets).to eq(expected)
  end


end
