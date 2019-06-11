# Rails Engine
 This is a [Turing: School of Software and Development](https://turing.io/) project which implements Rails and ActiveRecord to build a JSON:API which exposes the [SalesEngine](https://github.com/turingschool-examples/sales_engine/tree/master/data) data schema based on [Turing - Module 3 - Rales Engine](http://backend.turing.io/module3/projects/rails_engine) requirements.

### Concepts and Techniques
 * Advanced ActiveRecord queries
 * Serializing ActiveRecord queries via [Fast JSON API](https://github.com/Netflix/fast_jsonapi)
 * [JSON:API compliance](https://jsonapi.org/)

## Getting Started

### Prequisites
 * [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby version
 * [Rails 5.2.3](https://rubyonrails.org/) - Web Framework

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

Start-up the localhost server with
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


## Test Implementation

### Rspec
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
### SpecHarness

From the `rails_engine` directory, run `rails s`.

While the server is running and you are outside of the project folder run the following commands
```
git clone https://github.com/turingschool/rales_engine_spec_harness
cd rales_engine_spec_harness
bundle install
bundle exec rake
```

The previous sequence will run a test suite that represents the specs which this project is intended to adhere to and provide an output similar to the follow:
```
$ bundle exec rake
/Users/blakeenyart/.rbenv/versions/2.4.1/bin/ruby -I"lib:test" -I"/Users/blakeenyart/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/rake-10.4.2/lib" "/Users/blakeenyart/.rbenv/versions/2.4.1/lib/ruby/gems/2.4.0/gems/rake-10.4.2/lib/rake/rake_test_loader.rb" "test/business_logic/customer_business_logic_test.rb" "test/business_logic/item_business_logic_test.rb" "test/business_logic/merchant_business_logic_test.rb" "test/endpoints/customers_test.rb" "test/endpoints/invoice_items_test.rb" "test/endpoints/invoices_test.rb" "test/endpoints/items_test.rb" "test/endpoints/merchants_test.rb" "test/endpoints/transactions_test.rb" "test/relationships/customer_relationship_test.rb" "test/relationships/invoice_items_relationship_test.rb" "test/relationships/invoices_relationship_test.rb" "test/relationships/items_relationship_test.rb" "test/relationships/merchants_relationship_test.rb" "test/relationships/transactions_relationship_test.rb" 
Run options: --seed 31042

# Running:

...........................................................................................................

Fabulous run in 6.347828s, 16.8562 runs/s, 5742.4366 assertions/s.

107 runs, 36452 assertions, 0 failures, 0 errors, 0 skips
```

Ignore the error messages in the output as the priority is the output after the `# Running` statement.

## Author

 * **Blake Enyart** - *JSON:API endpoints and ActiveRecord queries in PostgreSQL database* - [RailsEngine](https://github.com/blake-enyart/rails-engine)
