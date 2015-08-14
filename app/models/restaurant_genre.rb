class RestaurantGenre < ActiveRecord::Base
  has_many :restaurant_genre_restaurants
  has_many :restaurant, through: :restaurant_genre_restaurants

  validates :name, presence: true
  validates :name, uniqueness: true
end
