class Player < ActiveRecord::Base
  belongs_to :selection
  has_many :firstentrys
  has_many :secondentrys
end
