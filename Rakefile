require "bundler/gem_tasks"

namespace :upstream do

  def generate_sass_dependencies
    find_upstream_css_files.map do |source|
      mod, base  = source.scan(/purecss\/src\/([a-z_]+)\/.+\/([a-z_-]+).css\Z/)[0]
      "app/assets/stylesheets/pure/#{mod}/_#{base}.css.sass"
    end
  end

  def find_upstream_css_files
    Dir['vendor/upstream/purecss/src/*/css/**/*.css']
  end

  desc "Import CSS files from upstream and convert them to SASS"
  task :import  => generate_sass_dependencies

  desc "Update upstream CSS files"
  task :update do
    sh "git submodule update vendor/upstream/purecss/"
  end

  rule(/.*\.css\.sass\Z/ => [proc { |t| t.sub(/\A.*\/([a-z_-]+)\/_([a-z_-]+)\.css\.sass\Z/, 'vendor/upstream/purecss/src/\1/css/\2.css') }]) do |t|
    sh "sass-convert -C -F css -T sass #{t.source.inspect} #{t.name.inspect}"
  end
end
