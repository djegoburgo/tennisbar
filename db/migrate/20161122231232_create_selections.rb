class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :firstentry, index: true, foreign_key: true
      t.references :secondentry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
