require 'flavour_saver'

module Pure
  module Sass
    class Translation

      attr_accessor :path

      def initialize(path)
        self.path = path
      end

      def render(destination)
        r = FS.evaluate(File.read(path), context)
        puts r
        File.write destination, r
      end

      def context
        DefaultTranslation.new
      end

    end
  end
end
