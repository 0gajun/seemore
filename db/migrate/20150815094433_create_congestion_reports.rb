class CreateCongestionReports < ActiveRecord::Migration
  def change
    create_table :congestion_reports do |t|
      t.integer   :user_id,       null: false
      t.integer   :restaurant_id, null: false
      t.integer   :congestion,    null: false
      
      t.timestamps null: false
    end

    add_index :congestion_reports, :user_id
    add_index :congestion_reports, :restaurant_id
  end
end
