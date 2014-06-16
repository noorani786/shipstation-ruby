require_relative '../lib/shipstation_ruby'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'turn/autorun'
 
Turn.config do |c|
  c.format  = :outline
  c.natural = true
  c.verbose = true
end
 
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end

#environment vars
include ShipStationRuby
ShipStationRuby.username = 'kaka'
ShipStationRuby.password = 'changchun'
ShipStationRuby.api_host = 'https://data.shipstation.com/1.2'
ShipStationRuby.store_id = '32199'
