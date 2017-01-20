json.extract! product, :id, :product, :customer, :measure, :value, :valid_from_day, :valid_to_day, :created_at, :updated_at
json.url product_url(product, format: :json)