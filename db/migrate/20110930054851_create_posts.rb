class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :weight
      t.datetime :initialPostDate
      t.boolean :answered
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
