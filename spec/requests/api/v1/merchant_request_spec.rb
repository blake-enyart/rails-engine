require 'rails_helper'

describe "Merchants API" do
  describe 'index' do
    it "can get all merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body)['data']

      expect(merchants.count).to eq(3)

      merchant_attributes = merchants[0]['attributes'].keys

      expect(merchant_attributes.include?('id')).to eq(true)
      expect(merchant_attributes.include?('name')).to eq(true)
      expect(merchant_attributes.include?('created_at')).to eq(false)
      expect(merchant_attributes.include?('updated_at')).to eq(false)
    end
  end

  describe 'show' do
    it "can get one merchants by its id" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body)['data']

      expect(merchant["id"].to_i).to eq(id)
    end

    it "can return a collection of items from a merchant" do
      merchant = create(:merchant)
      items_list = create_list(:item, 5, merchant: merchant)
      diff_items = create_list(:item, 5)

      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to be_successful

      items = JSON.parse(response.body)['data']

      expect(items.count).to eq(5)
      expect(items[0]['attributes']['name']).to eq(items_list[0].name)
      expect(items[0]['attributes']['name']).to_not eq(diff_items[0].name)
    end

    it "can return a collection of invoice_items from a merchant" do
      merchant = create(:merchant)
      invoices_list = create_list(:invoice, 5, merchant: merchant)
      diff_invoices = create_list(:invoice, 5)

      get "/api/v1/merchants/#{merchant.id}/invoices"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)['data']

      expect(invoices.count).to eq(5)
      expect(invoices[0]['attributes']['name']).to eq(invoices_list[0].name)
      expect(invoices[0]['attributes']['name']).to_not eq(diff_invoices[0].name)
    end
  end

  describe 'find' do
    it "can find by an id" do
      id = create(:merchant, id: 1, name: "name_1").id

      get "/api/v1/merchants/find?id=#{id}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body)

      expect(merchant['data']['attributes']['name']).to eq("name_1")
      expect(merchant['data']['id'].to_i).to eq(id)
    end

    it "can find by an name" do
      name = create(:merchant, name: "name_1").name

      get "/api/v1/merchants/find?name=Name_1"

      expect(response).to be_successful

      merchant = JSON.parse(response.body)['data']

      expect(merchant['attributes']['name']).to eq(name)
    end

    it "can find by a created_at" do
      merchant = create(:merchant, created_at: "2019-05-01 01:58:10 UTC")

      get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

      expect(response).to be_successful

      merchant_result = JSON.parse(response.body)

      expect(merchant_result['data']['attributes']['name']).to eq(merchant.name)
    end

    it "can find by an updated_at" do
      merchant = create(:merchant, updated_at: "2019-05-01 01:58:10 UTC")

      get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

      expect(response).to be_successful

      merchant_result = JSON.parse(response.body)

      expect(merchant_result['data']['attributes']['name']).to eq(merchant.name)
    end
  end

  describe 'find all' do
    it "can find all merchants by id" do
      merchants_list = create_list(:merchant, 5, name: "name_1")
      get "/api/v1/merchants/find_all?id=#{merchants_list[0].id}"

      expect(response).to be_successful

      merchants = JSON.parse(response.body)

      expect(merchants['data'].count).to eq(1)
    end

    it "can find all merchants by name" do
      name = create_list(:merchant, 5, name: "name_1")[0].name
      create_list(:merchant, 5, name: "name_2")

      get "/api/v1/merchants/find_all?name=NAme_1"

      expect(response).to be_successful

      merchants = JSON.parse(response.body)

      expect(merchants['data'].count).to eq(5)
      expect(merchants['data'][0]['attributes']['name']).to eq(name)
    end

    it "can find all merchants by created_at" do
      merchant = create_list(:merchant, 5, created_at: "2019-05-01 01:58:10 UTC")[0]
      create_list(:merchant, 5, created_at: "2019-03-01 01:58:10 UTC")

      get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

      expect(response).to be_successful

      merchants_result = JSON.parse(response.body)

      expect(merchants_result['data'].count).to eq(5)
    end

    it "can find all merchants by updated_at" do
      merchant = create_list(:merchant, 5, updated_at: "2019-05-01 01:58:10 UTC")[0]
      create_list(:merchant, 5, updated_at: "2019-03-01 01:58:10 UTC")

      get "/api/v1/merchants/find_all?updated_at=#{merchant.updated_at}"

      expect(response).to be_successful

      merchant_result = JSON.parse(response.body)

      expect(merchant_result['data'].count).to eq(5)
    end
  end

  describe 'random' do
    it 'pulls a random merchant resource' do
      merchants_list = create_list(:merchant, 5)

      get "/api/v1/merchants/random"

      expect(response).to be_successful

      merchant = JSON.parse(response.body)['data']

      expect(merchant['attributes'].present?).to eq(true)
    end
  end
end
