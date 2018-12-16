class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.boolean :is_admin, null: false, default: false
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
