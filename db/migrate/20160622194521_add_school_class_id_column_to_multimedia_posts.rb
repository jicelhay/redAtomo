class AddSchoolClassIdColumnToMultimediaPosts < ActiveRecord::Migration
  def change
    add_column :multimedia_posts, :school_class_id, :integer
  end
end
