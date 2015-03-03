class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :due_date
      t.boolean :completed, null: false, default: false
      t.integer :user_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
