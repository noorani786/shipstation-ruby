require_relative '../../spec_helper'

describe "ShipStationRuby::Order metaclass" do

  describe "Find order" do
    let(:client) { ShipStationRuby::Client.new }

    it "must find the right Order from the OData service" do
      VCR.use_cassette('find_order') do
        client.orders.find(21660574).order_id.must_equal 21660574
      end
    end

    it "must return a Rash object" do
      VCR.use_cassette('find_order') do
        client.orders.find(21660574).must_be_instance_of Hashie::Rash
      end
    end
  end

  describe "all orders" do
    let(:client) { ShipStationRuby::Client.new }

    it "must return an array of Rash objects" do
      VCR.use_cassette('all_orders') do
        client.orders.all.must_be_instance_of Array
      end
    end
  end

  describe "GET filtered order" do
    let(:client) { ShipStationRuby::Client.new }

    it "must get the correct filtered result with one parameter" do
      VCR.use_cassette('filtered_order_one_param') do
        order = client.orders.where("customer_id"=> 15843013).first
        order.order_id.must_equal 21660574
      end
    end

    it "must get the correct filtered result with two passed parameters" do
      VCR.use_cassette('filtered_order_two_params') do
        order = client.orders.where("order_id" => 21660574, "seller_id" => 105162).first
        order.order_id.must_equal 21660574
      end
    end
  end

  describe "Create order" do
    let(:client) { ShipStationRuby::Client.new }

    it "should create order by attributes" do
      VCR.use_cassette('create_order_with_attributes') do
        order = client.order.create(OrderNumber: "Test001")
        expect(order.order_number).to eq("Test001")
      end
    end
  end

  describe "Update order"
  describe "Delete order"
  describe "Destroy order"


end

