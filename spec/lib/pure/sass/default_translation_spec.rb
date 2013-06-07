require 'spec_helper'

describe Pure::Sass::DefaultTranslation do
  let(:trans) { Pure::Sass::DefaultTranslation.new }
  subject { trans }

  it { should respond_to(:yuiCssPrefix) }
  it { should respond_to(:prefix) }
  it { should respond_to(:skinName) }


  describe "#method_missing" do
    context "when calling #iCantBelieveThisWorksYo" do
      subject { trans.iCantBelieveThisWorksYo }
      it { should eq('$i-cant-believe-this-works-yo')}
    end
  end
end
