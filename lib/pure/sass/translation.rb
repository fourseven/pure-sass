require 'tilt'
require 'flavour_saver'

module Pure
  module Sass
    class Translation

      attr_accessor :path

      def initialize(path)
        self.path = path
      end

      def render(destination)
        File.write destination, tiltify.render(context)
      end

      def context
        raise "subclass me please"
      end

      private

      def open_template
        File.read path
      end

      def tiltify
        Tilt.new open_template
      end

    end
  end
end
