class ShiftGenerator
  attr_reader :keys,
              :offsets,
              :final_shifts

  def initialize
    @keys = nil
    @offsets = nil
    @final_shifts = nil
  end

  def receive_keys(keys_generated)
    @keys = keys_generated
  end

  def receive_offsets(offsets_generated)
    @offsets = offsets_generated
  end

  def generate_shifts
    keys = @keys
    offsets = @offsets
    @final_shifts =
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
    @final_shifts =
                    {
                      a: keys[:a] + offsets[:a],
                      b: keys[:b] + offsets[:b],
                      c: keys[:c] + offsets[:c],
                      d: keys[:d] + offsets[:d]
                    }
  end
end
