json.array! @searchItems do |searchItem|
  json.name searchItem.name
  json.id searchItem.id
  json.image_url searchItem.image_url
  json.description searchItem.description
  json.price searchItem.price
end
