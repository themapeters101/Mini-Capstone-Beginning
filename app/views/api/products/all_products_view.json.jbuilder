json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.descrpition product.descrpition
  json.image_url product.image_url
end