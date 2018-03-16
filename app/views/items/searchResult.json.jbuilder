json.array! @searchResults do |searchResult|
  json.name searchResult.name
  json.id searchResult.id
  json.image_url searchResult.image_url
  json.description searchResult.description
  json.price searchResult.price
end
