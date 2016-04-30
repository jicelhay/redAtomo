class AddAttrsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :teacher, :boolean
  end
end
