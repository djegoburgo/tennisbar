class Secondentry < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  has_many :selection
end
