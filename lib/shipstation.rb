require "rash"
require "ruby_odata"

require "shipstation_ruby/client"
require "shipstation_ruby/collection"
require "shipstation_ruby/version"

module ShipStation

  class ShipStationError < StandardError; end
  class AuthenticationError < ShipStationError; end
  class ConfigurationError < ShipStationError; end
  class QueryError < ShipStationError; end

end
