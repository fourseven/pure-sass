require 'spec_helper'
require 'fakefs/spec_helpers'
require 'pure/sass/generator'

describe Pure::Sass::Generator do
  include FakeFS::SpecHelpers

  let(:install_path) { File.join(File.dirname(File.dirname(File.dirname(__FILE__))), 'pure') }

  describe 'installation' do

    before { Pure::Sass::Generator.new.install }

    it 'should add the correct files' do
      File.exist?(File.join(install_path, 'all.css.scss')).should be_true
    end
  end
end