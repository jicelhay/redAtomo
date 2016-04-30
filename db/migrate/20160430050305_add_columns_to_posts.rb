class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :school_class_id, :integer
    add_column :posts, :user_id, :integer
  end
end
