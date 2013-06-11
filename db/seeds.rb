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