class AddPlayerToFirstentry < ActiveRecord::Migration
  def change
    add_reference :firstentries, :player, index: true, foreign_key: true
  end
end
