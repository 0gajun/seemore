class RestaurantGenreRestaurant < ActiveRecord::Base
  belongs_to :restaurant, dependent: :destroy
  belongs_to :genre,      dependent: :destroy

  validates :restaurant_id, presence: true
  validates :genre_id,      presence: true
end
