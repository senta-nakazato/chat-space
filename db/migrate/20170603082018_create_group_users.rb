class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.integer :user_id, foreign_key: true, null: false
      t.integer :group_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
