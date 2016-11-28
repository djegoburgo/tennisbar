class DropFirstEntriesTable < ActiveRecord::Migration
  def change
    drop_table :first_entries
  end
end
