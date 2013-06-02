class FxCompany < ActiveRecord::Base
  attr_accessible :name, :url, :comment

  has_many :exchanges
end
