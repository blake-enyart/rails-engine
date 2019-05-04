# Rales Engine
This is a [Turing: School of Software and Development](https://turing.io/) project which implements Rails and ActiveRecord to build a JSON:API which exposes the [SalesEngine](https://github.com/turingschool-examples/sales_engine/tree/master/data) data schema based on [Turing - Module 3 - Rales Engine](http://backend.turing.io/module3/projects/rails_engine) requirements

### Concepts and Techniques
* Advanced ActiveRecord queries
* Serializing ActiveRecord queries via [Fast JSON API](https://github.com/Netflix/fast_jsonapi)
* [JSON:API compliance](https://jsonapi.org/)

## Getting Started

### Prequisites
* [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby version
* [Rails 5.2.3](http://sinatrarb.com/) - Web Framework

### Installation
Clone down the repository with
```
git clone git@github.com:blake-enyart/rails-engine.git
```
Install the requisite gem dependencies
```
bundle install
```
Setup the database using
```
rails db:{drop,create,migrate}
```
Load data into the database using
```
rake import:{customers,merchants,items,invoices,invoice_items,transactions}
```

## JSON:API Endpoint Exploration

Observe various API endpoints by the following steps:

Start-up the localhost server with
```
rails s
```
in a separate terminal, query the available routes with
```
rails routes
```
copy any of those URIs and append to the `localhost:3000/` in your browser.

**NOTE:** For those that require an `id` please replace the `:id` in URIs with an integer number to observe the output

## How to run the test suite

From the command line interface(CLI), run
 ```
 rspec
 ```

## Author

* **Blake Enyart** - *JSON:API endpoint development in RoR and advanced ActiveRecord queries in PostgreSQL database* - [RailsEngine](https://github.com/blake-enyart/rails-engine)
