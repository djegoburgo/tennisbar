class Player < ActiveRecord::Base
  has_many :picks
  has_many :firstentrys
  has_many :secondentrys
  has_many :ranks
end
