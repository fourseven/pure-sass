require 'spec_helper'

describe Pure::Sass::DefaultTranslation do
  let(:trans) { Object.new.tap { |o| o.extend Pure::Sass::DefaultTranslation} }
  subject { trans }

  it { should respond_to(:yuiCssPrefix) }

  describe "#method_missing" do
    context "when calling #iCantBelieveThisWorksYo" do
      subject { trans.iCantBelieveThisWorksYo }
      it { should eq('$i-cant-believe-this-works-yo')}
    end
  end
end
