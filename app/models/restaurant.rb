class Restaurant < ActiveRecord::Base
  has_many :restaurant_genre_restaurants
  has_many :restaurant_genres, through: :restaurant_genre_restaurants

  # 存在性チェック
  validates :name, presence: true
end
