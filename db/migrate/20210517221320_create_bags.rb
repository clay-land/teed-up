class CreateBags < ActiveRecord::Migration[6.0]
  def change
    create_table :bags do |t|
      t.string :name
      t.text :description
      t.string :location
      t.float :rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
