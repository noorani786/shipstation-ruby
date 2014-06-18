module ShipStationRuby
  class Collection

    attr_accessor :client, :klass, :namespace

    def initialize(client, klass, namespace)
      @client = client
      @klass = klass
      @namespace = namespace
    end

    def find(id)
      @client.send("#{@klass}", id)
      result = @client.execute.first
      hashie_object(result)
    end

    def all
      @client.send("#{@klass}")
      results = @client.execute
      results.map{|rrr| hashie_object(rrr) }
    end

    # filter
    # http://msdn.microsoft.com/en-us/library/ff478141.aspx
    # http://www.odata.org/documentation/odata-version-3-0/odata-version-3-0-core-protocol
    # http://docs.oasis-open.org/odata/odata/v4.0/os/part1-protocol/odata-v4.0-os-part1-protocol.html#_Built-in_Query_Functions
    def where(query)
      if query.is_a?(Hash)
        query_string = ""
        query_array = []
        query.each do |key, val|
          # shipstation_style_attribute = attribute.to_s.classify.gsub(/Id/, 'ID')
          if val.is_a?(Integer)
            filter_string = "#{key} eq #{val}"
          elsif val.is_a?(String)
            filter_string = "#{key} eq '#{val}'"
          else
            raise ShipStationRuby::QueryError, "Query value incorrect."
          end
          query_array << filter_string
        end
        query_string = query_array.join(' and ')
      elsif query.is_a?(String)
        query_string = query
      else
        raise ShipStationRuby::QueryError, "Query incorrect."
      end
      @client.send("#{@klass}").filter("#{query_string}")
      results = @client.execute
      results.map{|rrr| hashie_object(rrr) }
    end

    def first
      @client.send("#{@klass}").send("order_by", "CreateDate asc").send("top", 1)
      result = @client.execute.first
      hashie_object(result)
    end

    def last
      @client.send("#{@klass}").send("order_by", "CreateDate desc").send("top", 1)
      result = @client.execute.first
      hashie_object(result)
    end

    def count
      @client.send("#{@klass}").send("count")
      @client.execute
    end

    # client.order.create(OrderNumber: "HAHA1111", OrderStatusID: 2)
    def create(attrs={})
      klazz = "#{@namespace}::#{@klass.singularize}".constantize.new
      attrs.each do |key, val|
        klazz.send("#{key.to_s}=", val)
      end
      @client.send("AddTo#{@klass}", klazz)
      result = @client.send("save_changes").first
      hashie_object(result)
    end

    # client.orders.update(43478396, OrderNumber: "HAHA1111")
    def update(id, attrs={})
      @client.send("#{@klass}", id)
      klazz = @client.execute.last
      attrs.each do |key, val|
        klazz.send("#{key.to_s}=", val)
      end
      @client.send("update_object", klazz)
      @client.send("save_changes")
    end

    # client.orders.delete(123)
    def delete(id)
      update(id, {active: false})
    end

    # client.orders.destroy(123)
    def destroy(id)
      @client.send("#{@klass}", id)
      klazz = @client.execute.last
      @client.send("delete_object", klazz)
      @client.send("save_changes")
    end

    private

      def hashie_object(result)
        return if result.nil?
        result_hash = JSON.parse(result.to_json)
        Hashie::Rash.new(result_hash)
      end

  end
end
