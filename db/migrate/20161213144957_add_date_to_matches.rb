class AddDateToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :match_date, :datetime
  end
end
