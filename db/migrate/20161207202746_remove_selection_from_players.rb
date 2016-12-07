class RemoveSelectionFromPlayers < ActiveRecord::Migration
  def change
    remove_reference(:players, :selection, index: true, foreign_key: true)
  end
end
