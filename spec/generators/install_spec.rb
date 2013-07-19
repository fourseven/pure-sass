require 'spec_helper'
require 'pure/sass/generator'

describe Pure::Sass::Generator, fakefs: true do

  let(:install_path) { File.join(File.dirname(File.dirname(File.dirname(__FILE__))), 'pure') }

  describe 'installation' do

    before do
      FakeFS::FileSystem.clone(File.join(File.dirname(File.dirname(File.dirname(__FILE__)))))
      Pure::Sass::Generator.new.install
    end

    it 'should add the correct files' do
      File.exist?(File.join(install_path, 'all.css.scss')).should be_true
    end
  end
end