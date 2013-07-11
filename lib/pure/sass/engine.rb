module Pure
  module Sass
    if defined?(::Rails::Engine)
      class Engine < ::Rails::Engine
      end
    end
  end
end