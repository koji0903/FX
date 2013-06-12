class Historical < ActiveRecord::Base
  belongs_to :exchange
  belongs_to :fx_company
  attr_accessible :change, :date, :end, :highest, :lowest, :start
  attr_accessible :fx_company_id, :exchange_id

#  validate :date, :uniqueness => true
end
