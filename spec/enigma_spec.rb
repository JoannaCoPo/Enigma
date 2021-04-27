require 'rspec'
require 'date'
require './lib/enigma'
require './lib/shift_generator'
require './lib/key_generator'
require './lib/offset_generator'
require './lib/message'

RSpec.describe Enigma do
  xit 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an_instance_of(Enigma)
  end

  xit 'can add shifts collection' do
    enigma = Enigma.new
    shift_generator = ShiftGenerator.new
    key_generator = KeyGenerator.new
    offset_generator = OffsetGenerator.new
    key_generator.generate_keys_from_args("02715")
    keys_generated = key_generator.keys_generated
    shift_generator.receive_keys(keys_generated)
    offset_generator.generate_offsets_from_args("040895")
    offsets_generated = offset_generator.offsets_generated
    shift_generator.receive_offsets(offsets_generated)
    shift_generator.generate_shifts
    shift_generated = shift_generator.final_shifts
    enigma.receives_shifts(shift_generated)
    expected = {:a=>3, :b=>27, :c=>73, :d=>20}

    expect(enigma.shifts).to eq(expected)
  end

  # it 'has tools for encryption' do
  #   enigma = Enigma.new
  #   shift1 = Shift.new
  #   shift1.generate_shifts
  #   enigma.add_shifts(shift1)
  #   expect(enigma.key_string).to be_an_instance_of(String)
  #   expect(enigma.key_string.length).to eq(5)
  #   expect(enigma.date_string).to be_an_instance_of(String)
  #   expect(enigma.date_string.length).to eq(6)
  # end

  xit 'has a character set' do
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r",
                "s", "t", "u", "v", "w", "x", "y", "z", " "]
    expect(enigma.alphabet).to eq(expected)
  end

  xit 'can add a message to encrypt' do
    enigma = Enigma.new
    message1 = Message.new("Hello World")
    message  = message1.message_to_encrypt
    enigma.add_message(message)
    expect(enigma.original_message).to eq("Hello World")
  end

  xit 'separates messages letters and preps for lowercase translation' do
    enigma = Enigma.new
    message1 = Message.new("Hello World")
    message  = message1.message_to_encrypt
    enigma.add_message(message)
    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    expect(enigma.message_to_array).to eq(expected)
  end

  xit 'it encrypts message' do
    enigma = Enigma.new
    message1 = Message.new("Hello World")
    shift_generator = ShiftGenerator.new
    key_generator = KeyGenerator.new
    offset_generator = OffsetGenerator.new
    key_generator.generate_keys_from_args("02715")
    keys_generated = key_generator.keys_generated
    shift_generator.receive_keys(keys_generated)
    offset_generator.generate_offsets_from_args("040895")
    offsets_generated = offset_generator.offsets_generated
    shift_generator.receive_offsets(offsets_generated)
    shift_generator.generate_shifts
    shift_generated = shift_generator.final_shifts
    enigma.receives_shifts(shift_generated)
    message  = message1.message_to_encrypt
    enigma.add_message(message)
    expected = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"]
    expect(enigma.encrypt_strings).to eq(expected)
  end

  xit 'it returns encrypted characters to one string' do
    enigma = Enigma.new
    message1 = Message.new("Hello World")
    shift_generator = ShiftGenerator.new
    key_generator = KeyGenerator.new
    offset_generator = OffsetGenerator.new
    key_generator.generate_keys_from_args("02715")
    keys_generated = key_generator.keys_generated
    shift_generator.receive_keys(keys_generated)
    offset_generator.generate_offsets_from_args("040895")
    offsets_generated = offset_generator.offsets_generated
    shift_generator.receive_offsets(offsets_generated)
    shift_generator.generate_shifts
    shift_generated = shift_generator.final_shifts
    enigma.receives_shifts(shift_generated)
    message  = message1.message_to_encrypt
    enigma.add_message(message)
    enigma.encrypt_strings
    expect(enigma.join_strings).to eq("keder ohulw")
  end

  xit 'it encrypts message' do
    enigma = Enigma.new
    message1 = Message.new("Hello World")
    shift_generator = ShiftGenerator.new
    key_generator = KeyGenerator.new
    offset_generator = OffsetGenerator.new
    key_generator.generate_keys_from_args("02715")
    keys_generated = key_generator.keys_generated
    shift_generator.receive_keys(keys_generated)
    offset_generator.generate_offsets_from_args("040895")
    offsets_generated = offset_generator.offsets_generated
    shift_generator.receive_offsets(offsets_generated)
    shift_generator.generate_shifts
    shift_generated = shift_generator.final_shifts
    enigma.receives_shifts(shift_generated)
    message  = message1.message_to_encrypt
    expected = {
                encryption: "keder ohulw",
                       key: "02715",
                      date: "040895"
               }
    expect(enigma.encrypt(message, "02715", "040895")).to eq(expected)
  end

  it 'it decrypts' do                  #returns hash
    enigma = Enigma.new
    message1 = Message.new("Hello World")
    shift_generator = ShiftGenerator.new
    key_generator = KeyGenerator.new
    offset_generator = OffsetGenerator.new
    key_generator.generate_keys_from_args("02715")
    keys_generated = key_generator.keys_generated
    shift_generator.receive_keys(keys_generated)
    offset_generator.generate_offsets_from_args("040895")
    offsets_generated = offset_generator.offsets_generated
    shift_generator.receive_offsets(offsets_generated)
    shift_generator.generate_shifts
    shift_generated = shift_generator.final_shifts
    enigma.receives_shifts(shift_generated)
    message  = message1.message_to_encrypt
    # enigma.encrypt_strings
    decrypted = enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}

    expect(decrypted).to eq(expected)
  end

end

#HELPERS TO TEST
