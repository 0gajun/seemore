class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # チェックイン情報
  has_many :check_ins
  # 混雑レポート
  has_many :congestion_reports
  # フォロー関係
  has_many :follows, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :follows, source: :followee
  has_many :reverse_follows, foreign_key: "followee_id", class_name: "Follow", dependent: :destroy
  has_many :followers, through: :reverse_follows, source: :follower

  # 存在性チェック
  validates :username,  presence: true
  validates :email,     presence: true
  validates :sex,       presence: true
  # ユニーク制約チェック
  validates :username,  uniqueness: true
  validates :email,     uniqueness: true
  # 性別の値範囲チェック
  validates :sex,       inclusion: { in: 0..2 }


  def following?(other_user)
    follows.find_by(followee_id: other_user.id)
  end

  def follow!(other_user)
    follows.create!(followee_id: other_user.id)
  end

  def unfollow!(other_user)
    follows.find_by(followee_id: other_user.id).destroy!
  end
end
