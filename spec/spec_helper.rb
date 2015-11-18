require 'codeclimate-test-reporter'
require 'square'

CodeClimate::TestReporter.start
Square.access_token = 'whatever man'

Dir["./spec/support/**/*.rb"].each {|f| require f}
