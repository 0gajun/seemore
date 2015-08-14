class CreateRestaurantGenres < ActiveRecord::Migration
  def change
    create_table :restaurant_genres do |t|
      # ジャンル名
      t.string    :name,    null: false

      t.timestamps null: false
    end
    add_index :restaurant_genres, :name, unique: true
  end
end
