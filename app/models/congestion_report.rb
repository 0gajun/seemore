class CongestionReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  ## バリデーション
  validates :user_id,       presence: true
  validates :restaurant_id, presence: true
  validates :congestion,    presence: true
  # 混雑レポートは1-4の間
  validates :congestion,    inclusion: { in: 1..4 }
end
