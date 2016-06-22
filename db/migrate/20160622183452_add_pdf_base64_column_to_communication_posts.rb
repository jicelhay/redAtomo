class AddPdfBase64ColumnToCommunicationPosts < ActiveRecord::Migration
  def change
    add_column :communication_posts, :pdf_base64, :string
  end
end
