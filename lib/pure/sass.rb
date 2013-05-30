require "pure/sass/version"
require "pure/sass/translation"

module Pure
  module Sass
    if defined? Rails::Engine
      class Engine < Rails::Engine
      end
    end
  end
end
