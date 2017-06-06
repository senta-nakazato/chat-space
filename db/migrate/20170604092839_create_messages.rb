class CreateMessages < ActiveRecord::Migration[5.0]
   def change
      create_table :messages do |t|
        t.text :text
        t.references :user, null: false
        t.references :group, null: false
        t.timestamps null: false
      end
      add_foreign_key :messages, :users, column: :user_id
      add_foreign_key :messages, :groups, column: :group_id
    end
end
