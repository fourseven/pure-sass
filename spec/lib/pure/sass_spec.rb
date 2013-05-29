module Rails
  class Engine
  end
end

require 'pure/sass'

describe Pure::Sass::Engine do
  it { should be_a(Rails::Engine) }
end
