module ShipStationRuby
  class Client
    attr_accessor :auth, :client, :namespace

    # require "shipstation_ruby"
    # client = ShipStationRuby::Client.new(APICONFIG[:ship_station_api], APICONFIG[:ship_station_account], APICONFIG[:ship_station_password])
    def initialize(api_host, username, password, namespace = "SS")
      raise ArgumentError unless username && password && api_host
      @auth = {:username => username, :password => password, :namespace => namespace}
      @client = OData::Service.new(api_host, @auth)
      @namespace = namespace
    end

    # client.orders.all
    # client.ShippingProviders.all
    # client.stores.all
    # client.orders.create(OrderNumber: "Test0001", OrderStatusID; 2)
    # client.orders.where("CreateDate ge datetime'2014-06-17'")
    def method_missing(method, *args, &block)
      method = method.to_s
      options = args.last.is_a?(Hash) ? args.pop : {}
      klass = method.pluralize.camelize
      ShipStationRuby::Collection.new(@client, klass, @namespace)
    end

    def inspect
      "#<ShipStationRuby::Client:#{object_id}>"
    end

  end
end