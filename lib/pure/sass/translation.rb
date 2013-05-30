require 'flavour_saver'

module Pure
  module Sass
    class Translation

      attr_accessor :path

      def initialize(path)
        self.path = path
      end

      def render(destination)
        File.write destination, FS.evaluate(File.read(path), context)
      end

      def context
        DefaultTranslation.new
      end

    end
  end
end
