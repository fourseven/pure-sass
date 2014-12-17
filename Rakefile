require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'nokogiri'
require 'pure/sass'

RSpec::Core::RakeTask.new(:spec)

namespace :website do
  desc "Scrape the pure website for tempates"
  task :scrape do
    dir = Dir.mktmpdir
    sh("wget -O #{dir}/index.html http://yui.github.io/skinbuilder/?mode=pure")
    @outfile = "#{dir}/index.html"
  end

  def template_files
    {
      form: "forms",
      buttons: "buttons",
      table: "tables",
      list: "lists"
    }
  end

  template_files.each do |template_key, template_value|
    file "app/assets/stylesheets/pure/#{template_value}/#{template_value}-theme.css.handlebars" => :scrape do |task|
      sh("mkdir -p app/assets/stylesheets/pure/#{template_value}")
      File.open(task.name, 'w') do |file|
        file.write(extract_template(template_key))
      end
    end
  end

  rule ".scss" => ".handlebars" do |task|
    Pure::Sass::Translation.new(task.source).render(task.name)
  end

  def generate_dependencies(file_extension)
    template_files.values.map { |f| "app/assets/stylesheets/pure/#{f}/#{f}-theme.css.#{file_extension}" }
  end

  def extract_template(name)
    doc = Nokogiri::HTML(File.read(@outfile))
    doc.css("##{name}-template").first.content
  end

  desc "Templates"
  task :templates => generate_dependencies("handlebars")

  desc "SCSS"
  task :scss => generate_dependencies("scss")

  desc "Clean handlebars and index file(s)"
  task :clean do
    generate_dependencies("handlebars").each do |file|
      sh("rm #{file}")
    end
    sh("rm #{@outfile}")
  end
end

namespace :upstream do

  def generate_sass_dependencies
    find_upstream_css_files.map do |source|
      mod, base  = source.scan(/purecss\/src\/([a-z_]+)\/.+\/([a-z_-]+).css\Z/)[0]
      "app/assets/stylesheets/pure/#{mod}/#{base}.css.scss"
    end
  end

  def sass_files
    %w[ all defaults base buttons forms grids menus tables ]
  end

  def generate_top_level_dependencies
    sass_files.map { |p| "app/assets/stylesheets/pure/#{p}.css.scss" }
  end

  def find_upstream_css_files
    Dir['vendor/upstream/purecss/src/*/css/**/*.css']
  end

  desc "Import CSS files from upstream and convert them to Sass"
  task :import => generate_sass_dependencies

  task :combine => generate_top_level_dependencies

  desc "Update upstream CSS files"
  task :update do
    sh "git submodule update vendor/upstream/purecss/"
  end

  generate_top_level_dependencies.each do |path|
    file path do
      if File.basename(path) == 'all.css.scss'
        File.write(path, (sass_files - ['all']).map { |f| "@import \"#{f}\";\n" }.join)
      else
        dir_path = path.gsub(/\.css\.scss\Z/, '')
        mod = File.basename(dir_path)
        File.open(path, "w") do |file|
          Dir["#{dir_path}/*.scss"].each do |sass|
            file.puts "@import \"#{mod}/#{File.basename(sass).gsub(/\.css\.scss\Z/, '')}\";"
          end
        end
      end
    end
  end

  rule(/.*\.css\.scss\Z/ => [proc { |t| t.sub(/\A.*\/([a-z_-]+)\/([a-z_-]+)\.css\.scss\Z/, 'vendor/upstream/purecss/src/\1/css/\2.css') }]) do |t|
    sh "mkdir -p #{File.dirname(t.name).inspect}"
    sh "cp #{t.source.inspect} #{t.name.inspect}"
  end
end

desc "Build the combined output from :website and :upstream"
task :generate => ["upstream:import", "website:scss", "upstream:combine", "website:clean"]

task :default => [ :spec ]
