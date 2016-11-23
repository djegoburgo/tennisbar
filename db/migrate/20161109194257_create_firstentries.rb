class CreateFirstentries < ActiveRecord::Migration
  def change
    create_table :firstentries do |t|
      t.integer :draw_position
      t.references :match, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
