require 'spec_helper'

describe Sprockets do
  let(:path) { File.expand_path('../../app/assets/stylesheets/', __FILE__) }
  let(:environment) { Sprockets::Environment.new.tap { |e| e.append_path path } }

  subject { environment }

  %w[ all base buttons defaults forms grids menus tables ].each do |mod|
    describe "pure/#{mod}" do
      subject { environment["pure/#{mod}"] }
      its(:logical_path) { should eq("pure/#{mod}.css")}
    end

    describe "pure/_#{mod}" do
      subject { environment["pure/_#{mod}"] }
      its(:logical_path) { should eq("pure/_#{mod}.css")}
    end
  end

end
