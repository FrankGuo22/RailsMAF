json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :image_url, :price, :bottle_size, :company, :country, :grape_type, :suit_vegetarian
  json.url product_url(product, format: :json)
end
