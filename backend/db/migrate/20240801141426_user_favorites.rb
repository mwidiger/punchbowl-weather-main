class UserFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :user_favorites do |t|
      # TODO: Should be belongs_to but not implementing user table for this
      t.integer :user_id
      t.belongs_to :location, index: true

      # TODO: Should be included as part of the belongs_to but not implementing
      # user table at this time
      t.index :user_id, name: 'index_favorite_user'
      t.timestamps
    end
  end
end
