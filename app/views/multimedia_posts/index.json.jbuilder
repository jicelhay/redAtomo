json.array!(@multimedia_posts) do |multimedia_post|
  json.extract! multimedia_post, :id, :title
  json.url multimedia_post_url(multimedia_post, format: :json)
end
