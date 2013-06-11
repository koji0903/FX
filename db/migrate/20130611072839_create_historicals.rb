class CreateHistoricals < ActiveRecord::Migration
  def change
    create_table :historicals do |t|
      t.date :date
      t.float :start
      t.float :highest
      t.float :lowest
      t.float :end
      t.float :change
      t.references :exchange

      t.timestamps
    end
    add_index :historicals, :exchange_id
  end
end
