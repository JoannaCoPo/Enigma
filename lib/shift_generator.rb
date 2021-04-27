class ShiftGenerator
  attr_reader :keys,
              :offsets

  def initialize
    @keys = nil
    @offsets = nil
  end

  def receive_keys(keys_generated)
    @keys = keys_generated
  end

  def receive_offsets(offsets_generated)
    @offsets = offsets_generated
  end

  def generate_shifts
    keys = generate_keys
    offsets = generate_offsets
    # @final_shifts =
                    {
                      a: keys[:a] + offsets[:a],
                      b: keys[:b] + offsets[:b],
                      c: keys[:c] + offsets[:c],
                      d: keys[:d] + offsets[:d]
                    }
  end

# => when key and date are include
  def generate_shifts_from_args(key, date)
    keys = generate_keys_from_args(key)
    offsets = generate_offsets_from_args(date)
    # @final_shifts =
                    {
                      a: keys[:a] + offsets[:a],
                      b: keys[:b] + offsets[:b],
                      c: keys[:c] + offsets[:c],
                      d: keys[:d] + offsets[:d]
                    }
  end
end
