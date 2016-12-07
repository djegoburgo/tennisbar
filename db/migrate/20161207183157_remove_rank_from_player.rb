class RemoveRankFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :rank, :integer
  end
end
