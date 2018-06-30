class CreateRoundItems < ActiveRecord::Migration[5.2]
  def change
    create_table :round_items do |t|
      t.belongs_to :round, foreign_key: true
      t.integer :row, null: false
      t.integer :column, null: false
      t.integer :target_type, null: false
      t.integer :targeted_by_id, null: true
      t.timestamps
      t.index [:round_id, :row, :column], unique: true
      t.foreign_key :players, column: :targeted_by_id
    end
  end
end
