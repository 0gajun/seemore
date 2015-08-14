class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      # 店舗名
      t.string    :name,      null: false
      # 電話番号
      t.string    :tel
      # 紹介文
      t.text      :intro
      # 営業時間
      t.string    :open
      # 定休日
      t.string    :close
      # 住所
      t.string    :address
      # 経度
      t.decimal   :longitude
      # 緯度
      t.decimal   :latitude

      t.timestamps null: false
    end
  end
end
