# Rales Engine
 This is a [Turing: School of Software and Development](https://turing.io/) project which implements Rails and ActiveRecord to build a JSON:API which exposes the [SalesEngine](https://github.com/turingschool-examples/sales_engine/tree/master/data) data schema based on [Turing - Module 3 - Rales Engine](http://backend.turing.io/module3/projects/rails_engine) requirements.

### Concepts and Techniques
 * Advanced ActiveRecord queries
 * Serializing ActiveRecord queries via [Fast JSON API](https://github.com/Netflix/fast_jsonapi)
 * [JSON:API compliance](https://jsonapi.org/)

## Getting Started

### Prequisites
 * [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby version
 * [Rails 5.2.3](http://sinatrarb.com/) - Web Framework

### Installation

 To use this repository, simply clone it onto your machine and bundle:
 ```
 git clone git@github.com:blake-enyart/rails-engine.git
 cd rails-engine
 bundle
 ```

 Setup the database and load in data:
 ```
 rails db:{drop,create,migrate}
 rake import:{customers,merchants,items,invoices,invoice_items,transactions}
 ```

## JSON:API Endpoint Exploration

 Observe various API endpoints by the following steps:

 Navigate to this directory and start-up the localhost server with
 ```
 rails s
 ```

 In a separate terminal, query the available routes with
 ```
 rails routes
 ```

Copy any of those URIs and append to the `localhost:3000/` in your browser.

**NOTE:** For those that require an `id` please replace the `:id` in URIs with an integer number to observe the output

Example of expected output
```

{
 data: {
  id: null,
  type: "one_merchant_revenue",
  attributes: {
  revenue: "1518.84"
              }
        }
}

```


## Usage

Run test with `rspec`: 
 ```
 $ rspec

Randomized with seed 38704
.............................

Finished in 0.60246 seconds (files took 3.75 seconds to load)
29 examples, 0 failures

Randomized with seed 38704

Coverage report generated for RSpec to /Users/blakeenyart/turing/3module/projects/rails-engine/coverage. 75 / 87 LOC (86.21%) covered.
 ```

## Author

 * **Blake Enyart** - *JSON:API endpoints and ActiveRecord queries in PostgreSQL database* - [RailsEngine](https://github.com/blake-enyart/rails-engine)
