class Coupon < ActiveRecord::Base
  belongs_to  :restaurant,  dependent: :destroy

  validates :title,           presence: true
  validates :restaurant_id,   presence: true
  validates :content,         presence: true
  validates :expiration_date, presence: true
end
