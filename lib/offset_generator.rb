require 'date'
class OffsetGenerator
  attr_reader :offsets_generated

  def initialize
    @offsets_generated = nil
  end

  def offset_helper
    date = Date.today.strftime("%d%m%y").to_i
    date_squared = date.to_i ** 2
    string = date_squared.to_s
    string.slice(-4, 4)
  end

  def generate_offsets
    offset = offset_helper
    offset_collection = {
                          a: offset[0],
                          b: offset[1],
                          c: offset[2],
                          d: offset[3]
                        }
    @offsets_generated = offset_collection.transform_values(&:to_i)
  end

#FIX TESTS
  def generate_offsets_from_args(date)
    date_squared = date.to_i ** 2
    string = date_squared.to_s
    offset = string.slice(-4, 4)
    offset_collection = {
                            a: offset[0],
                            b: offset[1],
                            c: offset[2],
                            d: offset[3]
                        }
    @offsets_generated = offset_collection.transform_values(&:to_i)
  end
end
