# Adding the img property
class AddAttachmentImgToMultimediaPosts < ActiveRecord::Migration
  def self.up
    change_table :multimedia_posts do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :multimedia_posts, :img
  end
end
