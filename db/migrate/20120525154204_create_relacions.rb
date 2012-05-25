class CreateRelacions < ActiveRecord::Migration
  def change
    create_table :relacions do |t|
      t.integer :seguidor_id
      t.integer :seguido_id

      t.timestamps
    end
	add_index :relacions, :seguidor_id
    add_index :relacions, :seguido_id
    add_index :relacions, [:seguidor_id, :seguido_id], unique: true
  end
end
