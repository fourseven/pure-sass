require 'spec_helper'
require 'tempfile'

describe Pure::Sass::Translation do

  let(:path) { Tempfile.new(['foo', '.handlebars']).path }
  subject { Pure::Sass::Translation.new(path) }

  it { should respond_to(:path) }
  it { should respond_to(:render) }

  describe "#context" do
    specify { expect { subject.context }.to raise_error(/subclass me please/) }
  end

end
