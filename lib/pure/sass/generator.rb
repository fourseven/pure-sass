require 'pure/sass/version'
require 'fileutils'
require 'thor'

module Pure
  module Sass
    class Generator < Thor
      map ['-v', '--version'] => :version

      desc 'install', 'Install Pure-Sass'
      method_options path: :string
      def install
        FileUtils.mkdir_p(install_path)
        FileUtils.cp_r(stylesheets, install_path)
      end

      desc 'uninstall', 'Uninstall Pure-Sass'
      method_options path: :string
      def uninstall
        say 'Not yet implemented.'
      end

      desc 'version', 'Show Pure-Sass version'
      def version
        say "Pure-Sass #{ Pure::Sass::VERSION }"
      end

      private

        def install_path
          options[:path] ? 
            Pathname.new(File.join(options[:path]), 'pure') : 
            Pathname.new('pure')
        end

        def stylesheets_dir
          File.join(File.dirname(File.dirname(File.dirname(File.dirname(__FILE__)))), 'app', 'assets', 'stylesheets', 'pure')
        end

        def stylesheets
          Dir["#{ stylesheets_dir }/*"]
        end
    end
  end
end