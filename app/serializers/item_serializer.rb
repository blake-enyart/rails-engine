class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :name,
             :description,
             :unit_price,
             :merchant_id

  attribute :unit_price do |object|
    object.unit_price = (object.unit_price.to_f/100).to_s
  end
end
