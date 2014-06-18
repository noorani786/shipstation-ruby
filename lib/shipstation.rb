require "rash"
require "ruby_odata"

require "shipstation/client"
require "shipstation/collection"
require "shipstation/version"

module ShipStation

  class ShipStationError < StandardError; end
  class AuthenticationError < ShipStationError; end
  class ConfigurationError < ShipStationError; end
  class QueryError < ShipStationError; end

end
