class AddGenreForeignKeys < ActiveRecord::Migration
  def change
  end

  add_foreign_key :restaurant_genre_restaurants, :restaurants, column: :restaurant_id, on_delete: :cascade, on_update: :cascade
  add_foreign_key :restaurant_genre_restaurants, :restaurant_genres, column: :genre_id, on_delete: :cascade, on_update: :cascade
end
