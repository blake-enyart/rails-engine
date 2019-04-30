namespace :import do
  desc "rake import data from customers csv files"
  task customers: :environment do
    require 'csv'
    options = {headers: true}
    CSV.foreach('db/data/customers.csv', options) do |row|
      Customer.create!(row.to_hash)
    end
  end

  desc "rake import data from merchants csv files"
  task merchants: :environment do
    require 'csv'
    options = {headers: true}
    CSV.foreach('db/data/merchants.csv', options) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  desc "rake import data from invoices csv files"
  task invoices: :environment do
    require 'csv'
    options = {headers: true}
    CSV.foreach('db/data/invoices.csv', options) do |row|
      Invoice.create!(row.to_hash)
    end
  end

  desc "rake import data from items csv files"
  task items: :environment do
    require 'csv'
    options = {headers: true}
    CSV.foreach('db/data/items.csv', options) do |row|
      Item.create!(row.to_hash)
    end
  end

  desc "rake import data from invoice_items csv files"
  task invoice_items: :environment do
    require 'csv'
    options = {headers: true}
    CSV.foreach('db/data/invoice_items.csv', options) do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end

  desc "rake import data from transactions csv files"
  task transactions: :environment do
    require 'csv'
    options = {headers: true}
    CSV.foreach('db/data/transactions.csv', options) do |row|
      Transaction.create!(row.to_hash)
    end
  end
end
