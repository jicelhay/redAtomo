json.array!(@comments) do |comment|
  json.author comment.author.name
  json.body comment.body
  json.flagged comment.flagged
end
