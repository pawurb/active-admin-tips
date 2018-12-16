class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.integer :user_id, null: false
    end

    add_index :posts, :user_id
  end
end
