class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :restaurant_id, presence: true

  def self.from_followed_users_by(user)
    followed_user_ids = "SELECT followee_id FROM follows
                          WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
         user_id: user.id)
  end
end
