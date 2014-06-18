shipstation-ruby
================

This is a Ruby wrapper for [ShipStation](http://www.shipstation.com/)'s [OData API](http://api.shipstation.com/MainPage.ashx).

## 0.0.1 Features
[here](https://github.com/codyduval/shipstation-ruby)

## 0.0.2 Features

* Support spacename, You can use it with rails model Order and SS::Order. `SS` is default namespace.
* Support api host
* Collection Create

## 0.0.3 Features

* Collection Update
* Collection Delete( set attr Active = false )
* Collection Destroy( call `delete_object` )

## 0.0.4 Features

* Collection First
* Collection Last
* Collection Count
* Collection return Rash instance
* Collection Create return a instance, not Array.
* Collection Where by array
* Collection Where by String. eg. `client.orders.where("CreateDate ge datetime'2014-06-17'")` 
You can write a filter string, read more [here](http://msdn.microsoft.com/en-us/library/ff478141.aspx), [here](http://www.odata.org/documentation/odata-version-3-0/odata-version-3-0-core-protocol), and [here](http://docs.oasis-open.org/odata/odata/v4.0/os/part1-protocol/odata-v4.0-os-part1-protocol.html#_Built-in_Query_Functions)
* Test with shipstation api 1.3

## 0.0.5 Features

Rename the gem to shipstation-rb.


## Installation

``` ruby
gem 'shipstation-rb', '~> 0.0.5'
gem 'awesome_print', :require => 'ap'
```

## Rails Configuration

The ShipStation API uses basic HTTP authentication. Inside config/initializers, create a new configuration file and use the following template to pass in your ShipStation credentials:

``` ruby
ShipStation.username  = ENV['SHIPSTATION_USERNAME']
ShipStation.password  = ENV['SHIPSTATION_PASSWORD']
ShipStation.api_host  = ENV['SHIPSTATION_API_HOST']
```

OR

```ruby
require "shipstation"
client = ShipStation::Client.new(APICONFIG[:ship_station_api], APICONFIG[:ship_station_account], APICONFIG[:ship_station_password])
```

## Usage

### Set your credentials and create a new client:
``` ruby
ShipStation.api_host  = "https://data.shipstation.com/1.3"
ShipStation.password  = "shipstation_password"
ShipStation.password  = "shipstation_password"
client = ShipStation::Client.new
```

### Or create a new client by passing credentials directly:
``` ruby
client = ShipStation::Client.new("https://data.shipstation.com/1.3", "username", "password")
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
client = ShipStation::Client.new
order = client.order.find(12345)

order.order_id ## 12345
order.ship_city ## Boise
order.order_total ## $343.32
```

### Create order
```ruby
client = ShipStation::Client.new
client.order.create(OrderNumber: "T0001", OrderStatusID: 2)
```

### Update order
```ruby
client = ShipStation::Client.new
client.order.Update(1234, OrderNumber: "T0002", OrderStatusID: 2)
```

### Delete order
```ruby
client = ShipStation::Client.new
client.orders.delete(1234)  #=> order.active = false
```

### Destory order
```ruby
client = ShipStation::Client.new
client.orders.destory(1234) # svc.delete_object(klass)
```

### List all stores
```ruby
client = ShipStation::Client.new
client.stores.all
```

### First of clollection
```ruby
client = ShipStation::Client.new
client.stores.first
```

### Last of clollection
```ruby
client = ShipStation::Client.new
client.stores.last
```

## Requirements
This gem has been tested on Ruby 1.9.3 on version 1.1 of ShipStation's API.(by author)
This gem has been tested on Ruby ruby-2.0.0-p247 on version 1.2 and 1.3 of ShipStation's API.(By Rique Li)

## About This Gem

I am Rique Li, I fork this from [shipstation-ruby](https://github.com/codyduval/shipstation-ruby/) and make some changes, when all test done, I will make a PR.

If You like this gem, write me. ^_^


