class AddPlayerToSecondentry < ActiveRecord::Migration
  def change
    add_reference :secondentries, :player, index: true, foreign_key: true
  end
end
