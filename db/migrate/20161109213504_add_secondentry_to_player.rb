class AddSecondentryToPlayer < ActiveRecord::Migration
  def change
    add_reference :players, :secondentry, index: true, foreign_key: true
  end
end
