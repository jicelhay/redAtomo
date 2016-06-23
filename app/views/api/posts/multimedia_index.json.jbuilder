json.array!(@posts) do |post|
  json.id post.id
  json.url asset_url(post.img.url(:style))	 
end
