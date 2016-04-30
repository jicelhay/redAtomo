class CreateParentObligations < ActiveRecord::Migration
  def change
    create_table :parent_obligations do |t|

      t.timestamps null: false
    end
  end
end
