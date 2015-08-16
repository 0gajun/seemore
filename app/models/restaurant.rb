class Restaurant < ActiveRecord::Base
  # 店舗のジャンル
  has_many :restaurant_genre_restaurant
  has_many :restaurant_genre, through: :restaurant_genre_restaurant
  # メニュー情報
  has_many :menu
  # チェックイン情報
  has_many :check_in
  # 混雑レポート
  has_many :congestion_report
  # クーポン情報
  has_many :coupon

  # 存在性チェック
  validates :name, presence: true
end
