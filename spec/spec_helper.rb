require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'square'
require 'ap'
require 'webmock/rspec'

# https://github.com/codeclimate/ruby-test-reporter#webmocknetconnectnotallowederror
WebMock.disable_net_connect!(:allow => "codeclimate.com")

Square.access_token = 'whatever man'

Dir["./spec/support/**/*.rb"].each {|f| require f}
