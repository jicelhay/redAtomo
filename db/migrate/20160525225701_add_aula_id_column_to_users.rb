class AddAulaIdColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :aula_id, :integer
  end
end
