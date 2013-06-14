class Exchange < ActiveRecord::Base
  belongs_to :fx_company
  attr_accessible :kind, :path, :fx_company_id

  validates :kind, :presence => true
  validates :path, :presence => true

  has_many :historicals

end
