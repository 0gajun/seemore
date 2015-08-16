class Menu < ActiveRecord::Base
  belongs_to  :restaurant,  dependent: :destroy

  validates :restaurant_id,   presence: true
  validates :name,            presence: true

  # 価格は正の数．（但し，nil許可
  validates :price,           numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

end
