json.array!(@posts) do |post|
  json.id post.id
  json.date post.created_at.strftime("%F")
  json.author post.author.name
  json.title post.title
  json.body post.body
  json.likers json.array(post.likes) do |liker|
  	json.name liker.user.name
  	end
end
