class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :surname
      t.integer :amount
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
