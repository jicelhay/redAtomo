json.array!(@communication_posts) do |communication_post|
  json.extract! communication_post, :id
  json.url communication_post_url(communication_post, format: :json)
end
