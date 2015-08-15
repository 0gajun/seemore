class RestaurantGenreRestaurant < ActiveRecord::Base
  belongs_to :restaurant, dependent: :destroy
  belongs_to :restaurant_genre,      dependent: :destroy

  validates :restaurant_id, presence: true
  validates :genre_id,      presence: true
end
