class AddForeignKeyCoupon < ActiveRecord::Migration
  def change
    add_foreign_key :coupons, :restaurants, column: :restaurant_id, on_delete: :cascade, on_update: :cascade
  end
end
