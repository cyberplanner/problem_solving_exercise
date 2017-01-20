class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product
      t.string :customer
      t.string :measure
      t.decimal :value
      t.date :valid_from_day
      t.date :valid_to_day

      t.timestamps null: false
    end
  end
end
