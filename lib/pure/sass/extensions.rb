# module Sass::Script::Functions
#   def reverse(string)
#     assert_type string, :String
#     Sass::Script::String.new(string.value.reverse)
#   end
#   declare :reverse, :args => [:string]
# end

module Pure::Sass::Extensions
  def yui_skin_radius(*args)
    args.map { |a| compute_radius(a).to_sass }.join(' ')
  end

  def yui_skin_padding(*args)
    args.map { |a| compute_padding(a).to_sass }.join(' ')
  end

  private

  def compute_radius(factor, val=10)
    multiply_numbers(factor, val, 'px')
  end

  def compute_padding(factor, val=1)
    multiply_numbers(factor, val, 'em')
  end

  private

  def multiply_numbers(factor, val, default_units=nil)
    factor = Sass::Script::Number.new(factor) unless factor.respond_to? :value
    val    = Sass::Script::Number.new(val)    unless val.respond_to? :value
    result = Sass::Script::Number.new(factor.value * val.value, factor.numerator_units, val.denominator_units)
    result = result.coerce([default_units], []) if result.unitless? && default_units
    result
  end
end
