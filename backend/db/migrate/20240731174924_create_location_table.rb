class CreateLocationTable < ActiveRecord::Migration[7.0]
  def change
    create_table :location_tables do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.timestamps

      t.index :name, name: 'index_location_name', unique: true
      t.index %i[ latitude longitude ], name: 'index_location_coordinates', unique: true
    end
  end
end
