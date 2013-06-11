class Exchange < ActiveRecord::Base
  belongs_to :fx_company
  attr_accessible :kind, :path

  has_many :historicals
end
