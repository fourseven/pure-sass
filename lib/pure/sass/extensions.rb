# module Sass::Script::Functions
#   def reverse(string)
#     assert_type string, :String
#     Sass::Script::String.new(string.value.reverse)
#   end
#   declare :reverse, :args => [:string]
# end

module Pure::Sass::Extensions
  def yui_skin_radius(*args)
    args.map(&method(:computeRadius)).join(" ")
  end

  def yui_skin_padding()

  end

  def computeRadius(factor = 0.4, val = 10)
    factor = Sass::Script::Number.new(factor.to_s)
    val = Sass::Script::Number.new(val.to_s)
    factor.times(val)
    # unit = extract_unit(val)
    # if (unit == "px")
    #   val = val.to_i
    # else
    #   val = val.to_f
    # end
    # if (val > 0)
    #   "#{factor.to_f * val}#{unit}"
    # else
    #   "0"
    # end
  end

  def extract_unit(val, default_unit = "px")
    val = Sass::Script::Number.new(val)
    unit = unit(val)
    unit = default_unit if unit.value.length == 0
    unit
  end
end
