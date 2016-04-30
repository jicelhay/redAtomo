class AddColumnsToParentObligations < ActiveRecord::Migration
  def change
    add_column :parent_obligations, :user_id, :integer
    add_column :parent_obligations, :school_class_id, :integer
  end
end
