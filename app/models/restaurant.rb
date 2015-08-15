class Restaurant < ActiveRecord::Base
  # 店舗のジャンル
  has_many :restaurant_genre_restaurants
  has_many :restaurant_genres, through: :restaurant_genre_restaurants
  # チェックイン情報
  has_many :check_ins

  # 存在性チェック
  validates :name, presence: true
end
