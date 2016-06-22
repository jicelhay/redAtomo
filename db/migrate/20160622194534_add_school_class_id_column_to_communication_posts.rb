class AddSchoolClassIdColumnToCommunicationPosts < ActiveRecord::Migration
  def change
    add_column :communication_posts, :school_class_id, :integer
  end
end
