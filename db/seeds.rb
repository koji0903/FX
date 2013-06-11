# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FxCompany.create( :name => "M2J",
                  :url => "http://www.m2j.co.jp/" ,
                  :comment => ""
)
FxCompany.create( :name => "Monex FX",
                  :url  => "https://www.monexfx.co.jp/",
                  :comment => ""
)

# http://www.m2j.co.jp/market/pchistry_dl.php?ccy=1&type=d
#  1: USD/JYP
#  2: EUR/JPY
#  3; EUR/USD
=begin
Exchange.create( :fx_company_id => 1,
                 :kind => "USD/JPY",
                 :path => "market/pchistry_dl.php?ccy=1&type=d"
)

Exchange.create( :fx_company_id => 1,
                 :kind => "EUR/JPY",
                 :path => "market/pchistry_dl.php?ccy=2&type=d"
)

Exchange.create( :fx_company_id => 1,
                 :kind => "EUR/USD",
                 :path => "market/pchistry_dl.php?ccy=3&type=d"
)
=end