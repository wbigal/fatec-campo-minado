class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :winner_id, null: true
      t.timestamps
      t.foreign_key :players, column: :winner_id
    end
  end
end
