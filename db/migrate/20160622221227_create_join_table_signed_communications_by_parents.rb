class CreateJoinTableSignedCommunicationsByParents < ActiveRecord::Migration
  def change
    create_join_table :communication_posts, :users do |t|
      t.index :communication_post_id
      t.index :user_id
    end
  end
end
