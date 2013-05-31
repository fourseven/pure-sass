require 'flavour_saver'

module Pure
  module Sass
    class Translation

      attr_accessor :path

      def initialize(path)
        self.path = path
      end

      def render(destination)
        scss_output = FS.evaluate(File.read(path), context)
        File.write destination, scss_output.gsub(/#{context.prefix}#{context.skinName} ?/, "")
      end

      def context
        DefaultTranslation.new
      end

    end
  end
end
