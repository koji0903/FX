class Exchange < ActiveRecord::Base
  belongs_to :fx_company
  attr_accessible :kind, :path
end
