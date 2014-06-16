require "rash"
require "ruby_odata"

require "shipstation_ruby/client"
require "shipstation_ruby/collection"
require "shipstation_ruby/version"

module ShipStationRuby

  class ShipStationRubyError < StandardError; end
  class AuthenticationError < ShipStationRubyError; end
  class ConfigurationError < ShipStationRubyError; end

end
