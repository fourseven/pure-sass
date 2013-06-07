require "pure/sass/version"
require "pure/sass/default_translation"
require "pure/sass/translation"
require "pure/sass/extensions"

module Pure
  module Sass
    if defined? Rails::Engine
      class Engine < Rails::Engine
      end
    end
  end
end
