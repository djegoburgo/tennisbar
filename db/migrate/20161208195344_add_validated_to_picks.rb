class AddValidatedToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :validated, :boolean
  end
end
