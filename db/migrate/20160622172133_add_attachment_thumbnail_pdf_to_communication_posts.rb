class AddAttachmentThumbnailPdfToCommunicationPosts < ActiveRecord::Migration
  def self.up
    change_table :communication_posts do |t|
      t.attachment :thumbnail
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :communication_posts, :thumbnail
    remove_attachment :communication_posts, :pdf
  end
end
