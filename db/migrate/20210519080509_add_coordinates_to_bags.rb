class AddCoordinatesToBags < ActiveRecord::Migration[6.0]
  def change
    add_column :bags, :latitude, :float
    add_column :bags, :longitude, :float
  end
end
