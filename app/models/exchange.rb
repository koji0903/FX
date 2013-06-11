class Exchange < ActiveRecord::Base
  belongs_to :fx_company
  attr_accessible :kind, :path, :fx_company_id

  has_many :historicals
end
