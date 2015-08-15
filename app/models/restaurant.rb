class Restaurant < ActiveRecord::Base
  # 店舗のジャンル
  has_many :restaurant_genre_restaurant
  has_many :restaurant_genre, through: :restaurant_genre_restaurant
  # チェックイン情報
  has_many :check_in
  # 混雑レポート
  has_many :congestion_report

  # 存在性チェック
  validates :name, presence: true
end
