require 'fakefs/spec_helpers'
require 'spec_helper'
require 'pure/sass/generator'

describe Pure::Sass::Generator do
  include FakeFS::SpecHelpers

  let(:install_path) { File.join(File.dirname(File.dirname(File.dirname(__FILE__))), 'pure') }
  let(:base_scss_files) { ['all', 'base', 'buttons', 'forms', 'grids', 'menus', 'tables'] }


  describe 'installation' do

    before do
      FakeFS::FileSystem.clone(File.join(File.dirname(File.dirname(File.dirname(__FILE__)))))
      Pure::Sass::Generator.new.install
    end

    it 'should add the base files' do
      base_scss_files.each { |f| File.exist?(File.join(install_path, "#{ f }.css.scss")).should be_true }
    end

    context 'for subdirectories' do

      let(:subdirs_with_files) { { base: :normalize, buttons: :buttons, forms: :forms } }

      it 'should add the files' do
        subdirs_with_files.each_pair { |k, f| File.exist?(File.join(install_path, k.to_s, "#{ f }.css.scss")).should be_true }
      end
    end
  end
end