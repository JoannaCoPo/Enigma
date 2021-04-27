require 'date'
class OffsetGenerator
  attr_reader :todays_date

  def initialize
    @date_used = Date.today.strftime("%d%m%y")
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def offset_helper
    # date = Date.today.strftime("%d%m%y")
    # @date_used = date
    date = todays_date
    date_squared = date.to_i ** 2
    string = date_squared.to_s
    string.slice(-4, 4)
  end

  def generate_offsets
    # require "pry"; binding.pry
    offset = offset_helper
    offset_collection = {
                          a: offset[0],
                          b: offset[1],
                          c: offset[2],
                          d: offset[3]
                          # a: offset.slice(0, 2),
                          # b: offset.slice(1, 2),
                          # c: offset.slice(2, 2),
                          # d: offset.slice(3, 2)
                        }
    freeze = offset_collection.transform_values(&:to_i)
  end

  def generate_offsets_from_args(date)
    date_squared = date.to_i ** 2
    string = date_squared.to_s
    offset = string.slice(-4, 4)
    offset_collection = {
                            a: offset[0],
                            b: offset[1],
                            c: offset[2],
                            d: offset[3]
                          # a: offset.slice(0, 2),
                          # b: offset.slice(1, 2),
                          # c: offset.slice(2, 2),
                          # d: offset.slice(3, 2)
                        }
    freeze = offset_collection.transform_values(&:to_i)
  end
end
