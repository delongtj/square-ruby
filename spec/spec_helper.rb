require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'square'

Square.access_token = 'whatever man'

Dir["./spec/support/**/*.rb"].each {|f| require f}
