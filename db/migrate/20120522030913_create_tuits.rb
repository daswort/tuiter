class CreateTuits < ActiveRecord::Migration
  def change
    create_table :tuits do |t|
      t.string :contenido
      t.integer :usuario_id

      t.timestamps
    end
	add_index :tuits, [:usuario_id, :created_at]
  end
end
