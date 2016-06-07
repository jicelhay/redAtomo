class AddAulaIdColumnToSchoolClass < ActiveRecord::Migration
  def change
    add_column :school_classes, :aula_id, :integer
  end
end
