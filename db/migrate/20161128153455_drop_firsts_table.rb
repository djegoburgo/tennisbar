class DropFirstsTable < ActiveRecord::Migration
  def change
    drop_table :firsts
  end
end
