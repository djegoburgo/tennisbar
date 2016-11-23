class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :result_type
      t.integer :number_of_sets
      t.integer :winning_entry_id
      t.references :match, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
