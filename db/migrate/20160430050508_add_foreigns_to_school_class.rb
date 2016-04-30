class AddForeignsToSchoolClass < ActiveRecord::Migration
  def change
    add_column :school_classes, :school_id, :integer
    add_column :school_classes, :user_id, :integer
  end
end
