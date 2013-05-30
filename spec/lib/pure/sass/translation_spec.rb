require 'spec_helper'
require 'tempfile'

describe Pure::Sass::Translation do

  let(:path) { Tempfile.new(['foo', '.handlebars']).path }
  subject { Pure::Sass::Translation.new(path) }

  it { should respond_to(:path) }
  it { should respond_to(:render) }
  its('class.ancestors') { should include(Pure::Sass::DefaultTranslation) }

  describe 'rendering' do
    let(:fixture) { File.expand_path("../../../../fixtures/buttons.css.handlebars", __FILE__) }
    let(:output) { Tempfile.new(['foo', 'scss']).path }

    subject { Pure::Sass::Translation.new(fixture).render(output) }
    specify { expect { subject }.not_to raise_error }
  end
end
