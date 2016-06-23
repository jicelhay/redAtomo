class AddTypeToMultimediaPost < ActiveRecord::Migration
  def change
    add_column :multimedia_posts, :video, :boolean
  end
end
