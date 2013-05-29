require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

namespace :upstream do

  def generate_sass_dependencies
    find_upstream_css_files.map do |source|
      mod, base  = source.scan(/purecss\/src\/([a-z_]+)\/.+\/([a-z_-]+).css\Z/)[0]
      "app/assets/stylesheets/pure/#{mod}/#{base}.css.sass"
    end
  end

  def sass_files
    %w[ all base buttons forms grids menus tables ]
  end

  def generate_top_level_dependencies
    sass_files.map { |p| "app/assets/stylesheets/pure/#{p}.css.sass" }
  end

  def find_upstream_css_files
    Dir['vendor/upstream/purecss/src/*/css/**/*.css']
  end

  desc "Import CSS files from upstream and convert them to SASS"
  task :import => generate_sass_dependencies + generate_top_level_dependencies

  desc "Update upstream CSS files"
  task :update do
    sh "git submodule update vendor/upstream/purecss/"
  end

  generate_top_level_dependencies.each do |path|
    file path do
      if File.basename(path) == 'all.css.sass'
        File.write(path, sass_files.map { |f| "@import \"#{f}\"\n" }.join)
      else
        dir_path = path.gsub(/\.css\.sass\Z/, '')
        mod = File.basename(dir_path)
        File.open(path, "w") do |file|
          Dir["#{dir_path}/*.sass"].each do |sass|
            file.puts "@import \"#{mod}/#{File.basename(sass).gsub(/\.css\.sass\Z/, '')}\""
          end
        end
      end
    end
  end

  rule(/.*\.css\.sass\Z/ => [proc { |t| t.sub(/\A.*\/([a-z_-]+)\/([a-z_-]+)\.css\.sass\Z/, 'vendor/upstream/purecss/src/\1/css/\2.css') }]) do |t|
    sh "mkdir -p #{File.dirname(t.name).inspect}"
    sh "sass-convert -C -F css -T sass #{t.source.inspect} #{t.name.inspect}"
  end
end

task :default => [ :spec ]
