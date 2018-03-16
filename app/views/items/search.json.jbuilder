json.array! @search_items do |search_item|
  json.name search_item.name
  json.id search_item.id
  json.image_url search_item.images.first.image_url
  json.description search_item.description
  json.proposed_price search_item.proposed_price
end
