json.array! @searchItems do |searchItem|
  json.name searchItem.name
  json.id searchItem.id
  json.image_url searchItem.images.first.image_url
  json.description searchItem.description
  json.proposed_price searchItem.proposed_price
end
