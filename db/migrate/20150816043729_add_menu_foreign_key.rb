class AddMenuForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key :menus, :restaurants, column: :restaurant_id, on_delete: :cascade, on_update: :cascade
  end
end
