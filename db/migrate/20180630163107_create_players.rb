class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :session_id, limit: 32, null: false
      t.integer :score, null: false, default: 0
      t.string :name, limit: 15, null: false
      t.timestamps
      t.index :session_id, unique: true
    end
  end
end
