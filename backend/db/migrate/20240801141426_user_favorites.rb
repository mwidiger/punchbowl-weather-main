class UserFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :user_favorites do |t|
      # TODO: Should be belongs_to but not implementing user table for this
      t.integer :user_id
      t.belongs_to :location, index: true

      t.index [:user_id, :location_id], unique: true, name: 'index_favorite_user_location'
      t.index :location, name: "index_favorite_location"
      t.timestamps
    end
  end
end
