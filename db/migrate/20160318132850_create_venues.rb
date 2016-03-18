class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :title
      t.text :description
      t.integer :available_seats

      t.timestamps null: false
    end
  end
end
