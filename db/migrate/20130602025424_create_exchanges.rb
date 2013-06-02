class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.references :fx_company
      t.string :kind
      t.string :path

      t.timestamps
    end
    add_index :exchanges, :fx_company_id
  end
end
