class CreateCommunicationPosts < ActiveRecord::Migration
  def change
    create_table :communication_posts do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
