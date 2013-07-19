require 'bundler'
require 'fakefs/spec_helpers'
Bundler.require

RSpec.configure do |config|
  config.color_enabled = true
end

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers
end