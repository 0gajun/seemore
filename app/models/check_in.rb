class CheckIn < ActiveRecord::Base
  belongs_to :users
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :restaurant_id, presence: true

end
