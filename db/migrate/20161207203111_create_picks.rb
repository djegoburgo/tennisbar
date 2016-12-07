class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :player, index: true, foreign_key: true
      t.references :selection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
