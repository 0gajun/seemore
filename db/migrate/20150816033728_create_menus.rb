class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer   :restaurant_id, null: false
      t.string    :name,          null: false
      t.integer   :price
      t.integer   :category_id
      
      t.timestamps null: false
    end
    add_index :manus, :restaurant_id
  end
end
