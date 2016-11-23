class Player < ActiveRecord::Base
  has_many :firstentry
  has_many :secondentry
end
