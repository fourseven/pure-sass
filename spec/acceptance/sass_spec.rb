require 'sass'
require 'sass_importer'

describe "SASS Compilation without errors" do
  let(:source) { File.read File.join(path, 'all.css.scss') }
  let(:path)   { File.expand_path('../../../app/assets/stylesheets/pure/', __FILE__) }
  subject { Sass.compile(source, load_paths: [SassImporter.new(path)] ) }

  specify { expect { subject }.not_to raise_error }
end
