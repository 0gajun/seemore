class Restaurant < ActiveRecord::Base

  # 存在性チェック
  validates :name, presence: true

end
