require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(3)
  end

  it "can get one merchants by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants['data']["id"].to_i).to eq(id)
  end

  it "can create a new merchant" do
    merchant_params = { name: "Corey Sheesley" }

    post "/api/v1/merchants", params: {merchant: merchant_params}
    merchant = Merchant.last

    expect(response).to be_successful
    expect(merchant.name).to eq(merchant_params[:name])
  end

  it "can update an existing merchant" do
    id = create(:merchant).id
    previous_name = Merchant.last.name
    merchant_params = { name: "Jon Peterson" }

    put "/api/v1/merchants/#{id}", params: {merchant: merchant_params}
    
    merchant = Merchant.find_by(id: id)

    expect(response).to be_successful
    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq("Jon Peterson")
  end
end
