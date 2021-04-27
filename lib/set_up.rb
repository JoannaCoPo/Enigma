require 'date'
require_relative 'enigma'
require_relative 'message'
require_relative 'shift_generator'
require_relative 'key_generator'
require_relative 'offset_generator'

@enigma = Enigma.new
@message1 = Message.new("Hello World")
@shift_generator = ShiftGenerator.new
@key_generator = KeyGenerator.new
@offset_generator = OffsetGenerator.new

  def initiate_encryption
    @key_generator.generate_keys_from_args("02715")
    keys_generated = @key_generator.keys_generated
    @shift_generator.receive_keys(keys_generated)
    @offset_generator.generate_offsets_from_args("040895")
    offsets_generated = @offset_generator.offsets_generated
    @shift_generator.receive_offsets(offsets_generated)
    @shift_generator.generate_shifts
    shift_generated = @shift_generator.final_shifts
    @enigma.receives_shifts(shift_generated)
  end

  initiate_encryption
