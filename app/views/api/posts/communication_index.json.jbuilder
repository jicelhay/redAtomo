json.array!(@posts) do |post|
  json.id post.id
  json.url post.title	 
end

