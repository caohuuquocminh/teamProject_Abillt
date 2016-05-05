json.array!(@apps) do |app|
  json.extract! app, :id, :name, :rating, :price, :image_url
  json.url app_url(app, format: :json)
end
