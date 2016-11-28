class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|

      t.timestamps null: false
    end
  end
end
