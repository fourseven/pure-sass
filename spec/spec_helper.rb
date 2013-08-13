require 'bundler'
Bundler.require

RSpec.configure do |config|
  config.color_enabled = true
end

# From
# https://github.com/erikhuda/thor/blob/87dc98c6e2c183c9b1f867c6c8e1b62ede5242bc/spec/helper.rb
def capture(stream)
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    yield
    result = eval("$#{stream}").string
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end

  result
end