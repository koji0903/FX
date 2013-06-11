class Historical < ActiveRecord::Base
  belongs_to :exchange
  attr_accessible :change, :date, :end, :highest, :lowest, :start

  validate :date, :uniqueness => true
end
