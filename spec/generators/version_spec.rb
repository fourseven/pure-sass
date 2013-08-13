require 'spec_helper'
require 'pure/sass/generator'

describe Pure::Sass::Generator do
  
  describe "-v or --version" do

    let(:output) { capture(:stdout) { Pure::Sass::Generator.new.version }.strip }

    it "should output the correct version information" do        
      output.should == "Pure-Sass #{ Pure::Sass::VERSION }"
    end
  end
end