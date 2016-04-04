class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      t.references :venue, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
