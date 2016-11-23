class Match < ActiveRecord::Base
  belongs_to :round
  has_many :firstentrys
  has_many :secondentrys
  has_one :score
end
