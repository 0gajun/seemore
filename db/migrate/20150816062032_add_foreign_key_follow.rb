class AddForeignKeyFollow < ActiveRecord::Migration
  def change
    add_foreign_key :follows, :users, column: :follower_id, on_delete: :cascade, on_update: :cascade
    add_foreign_key :follows, :users, column: :followee_id, on_delete: :cascade, on_update: :cascade
  end
end
