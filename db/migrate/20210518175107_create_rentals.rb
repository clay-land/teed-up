class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bag, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
