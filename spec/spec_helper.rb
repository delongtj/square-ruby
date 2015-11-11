$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'square'

RSpec.configure do |config|
  config.formatter     = 'documentation'
end
