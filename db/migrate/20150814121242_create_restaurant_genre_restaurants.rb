class CreateRestaurantGenreRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurant_genre_restaurants do |t|
      t.integer   :restaurant_id,   null: false
      t.integer   :genre_id,        null: false

      t.timestamps null: false
    end

    add_index :restaurant_genre_restaurants, :restaurant_id 
    add_index :restaurant_genre_restaurants, :genre_id
  end
end
