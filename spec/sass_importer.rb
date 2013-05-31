class SassImporter < Sass::Importers::Filesystem
  def extensions
    {
      'css'          => :scss,
      'css.scss'     => :scss,
      'css.sass'     => :sass,
      'css.erb'      => :scss,
      'scss.erb'     => :scss,
      'sass.erb'     => :sass,
      'css.scss.erb' => :scss,
      'css.sass.erb' => :sass
    }.merge!(super)
  end
end
