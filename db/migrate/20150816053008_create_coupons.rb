class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string      :title,         null: false
      t.integer     :restaurant_id, null: false
      t.text        :content,       null: false
      t.text        :condition
      t.date        :expiration_date, null: false
      t.integer     :remain

      t.timestamps null: false
    end
  end
end
