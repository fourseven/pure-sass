require 'spec_helper'
require 'sass'

describe Pure::Sass::Extensions do
  let(:extensions) {Sass::Script::Functions::EvaluationContext.new({}).tap {|o| o.extend(Pure::Sass::Extensions)}}
  subject {extensions}

  it { should respond_to(:yui_skin_radius) }

  describe "yui_skin_radius" do
    subject { extensions.yui_skin_radius *radii }
    context "when there is only one radius" do
      let(:radii) {["4"]}
      it { should eq "40px" }
    end
    context "when there is four radii" do
      let(:radii) {["4", 4, 0, 0]}
      it { should eq "40px 40px 0 0" }
    end
  end

  it { should respond_to(:yui_skin_padding) }
end
