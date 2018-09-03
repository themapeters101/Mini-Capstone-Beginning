json.id product.id
json.name product.name
json.price product.price
json.tax product.tax
json.total product.total
json.descrpition product.descrpition
json.image_url product.image_url
json.discounted product.is_discounted?
json.link "http://localhost:3000/api/products/#{product.id}"


json.formatted do 
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end