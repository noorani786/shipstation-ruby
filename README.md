shipstation-ruby
================

This is a Ruby wrapper for [ShipStation](http://www.shipstation.com/)'s [OData API](http://api.shipstation.com/MainPage.ashx).

[0.0.1](https://github.com/codyduval/shipstation-ruby)

## 0.0.2 Features

* Support spacename
* Support api host
* Collection Create

## 0.0.3 Features

* Collection Update
* Collection Delete( set attr Active = false )
* Collection Destroy( call `delete_object` )

## Installation

``` ruby
gem 'shipstation-ruby', '~> 0.0.3'
gem 'awesome_print', :require => 'ap'
```

## Rails Configuration

The ShipStation API uses basic HTTP authentication. Inside config/initializers, create a new configuration file and use the following template to pass in your ShipStation credentials:

``` ruby
ShipStationRuby.username  = ENV['SHIPSTATION_USERNAME']
ShipStationRuby.password  = ENV['SHIPSTATION_PASSWORD']
ShipStationRuby.api_host  = ENV['SHIPSTATION_API_HOST']
```

## Usage

### Set your credentials and create a new client:
``` ruby
ShipStationRuby.api_host  = "https://data.shipstation.com/1.2"
ShipStationRuby.password  = "shipstation_password"
ShipStationRuby.password  = "shipstation_password"
client = ShipStationRuby::Client.new
```

### Or create a new client by passing credentials directly:
``` ruby
client = ShipStationRuby::Client.new("https://data.shipstation.com/1.2", "username", "password")
```
### Query a resource by record id:
``` ruby
order = client.order.find(12345)
```

### Get all records for any given resource in an array (paginated in batches of 100):
``` ruby
orders = client.order.all
```

### Query records for any resource by any attribute, returns an array:
``` ruby
open_texas_orders = client.order.where("active" => "true", "ship_state" => "TX")
```

### Other resources follow a similar pattern
``` ruby
all_warehouses = client.warehouse.all
customer_12345 = client.customer.find(12345)
texas_fedex_shipments = client.shipment.where("shipping_service_id" => 0001, "state" => "TX")
```
etc.

### Once returned, resources can be queried by field name
``` ruby
client = ShipStationRuby::Client.new
order = client.order.find(12345)

order.order_id ## 12345
order.ship_city ## Boise
order.order_total ## $343.32
```

### Create order
```ruby
client = ShipStationRuby::Client.new
client.order.create(OrderNumber: "T0001", OrderStatusID: 2)
```

### Update order
```ruby
client = ShipStationRuby::Client.new
client.order.Update(1234, OrderNumber: "T0002", OrderStatusID: 2)
```

### Delete order
```ruby
client = ShipStationRuby::Client.new
client.orders.delete(1234)  #=> order.active = false
```

### Destory order
```ruby
client = ShipStationRuby::Client.new
client.orders.destory(1234) # svc.delete_object(klass)
```

### List all stores
```ruby
client = ShipStationRuby::Client.new
client.stores.all
```

### First of clollection
```ruby
client = ShipStationRuby::Client.new
client.stores.first
```

### Last of clollection
```ruby
client = ShipStationRuby::Client.new
client.stores.last
```

## Requirements
This gem has been tested on Ruby 1.9.3 on version 1.1 of ShipStation's API.
This gem has been tested on Ruby ruby-2.0.0-p247 on version 1.2 of ShipStation's API.

## About This Gem

I am Rique Li, I fork this from [shipstation-ruby](https://github.com/codyduval/shipstation-ruby/) and make some changes, But not test all the functions.When all changed tested, I will make a PR.

If You like this gem, Plz let me know.


