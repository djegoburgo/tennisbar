class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :tournament_id
      t.integer :current_rank
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
