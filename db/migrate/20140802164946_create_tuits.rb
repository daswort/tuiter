class CreateTuits < ActiveRecord::Migration
  def change
    create_table :tuits do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :tuits, [:user_id, :created_at]
  end
end
