class CreateFxCompanies < ActiveRecord::Migration
  def change
    create_table :fx_companies do |t|
      t.string :name
      t.string :url
      t.string :comment
    end
  end
end
