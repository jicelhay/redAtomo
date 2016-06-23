class AddIsVideoToMultimediaPosts < ActiveRecord::Migration
  def change
    add_column :multimedia_posts, :is_video, :boolean
  end
end
