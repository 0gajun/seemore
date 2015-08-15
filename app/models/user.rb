class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # チェックイン情報
  has_many :check_ins

  # 存在性チェック
  validates :username,  presence: true
  validates :email,     presence: true
  validates :sex,       presence: true
  # ユニーク制約チェック
  validates :username,  uniqueness: true
  validates :email,     uniqueness: true
  # 性別の値範囲チェック
  validates :sex,       inclusion: { in: 0..2 }
end
