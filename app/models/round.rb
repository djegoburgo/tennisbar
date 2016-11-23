class Round < ActiveRecord::Base
  belongs_to :tournament
  has_many :matchs
end
