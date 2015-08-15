class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.integer   :user_id,       null: false
      t.integer   :restaurant_id, null: false
      t.integer   :menu_id
      t.text      :comment
      
      t.timestamps null: false
    end
    
    add_index :check_ins, :user_id
    add_index :check_ins, :restaurant_id
  end
end
