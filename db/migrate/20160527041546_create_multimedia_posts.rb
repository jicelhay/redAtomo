# Basic Media table, adding attachment on next migration
class CreateMultimediaPosts < ActiveRecord::Migration
  def change
    create_table :multimedia_posts do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
