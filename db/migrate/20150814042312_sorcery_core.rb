class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username,         :null => false
      t.string  :email,            :null => false
      t.string  :crypted_password
      t.string  :salt
      t.string  :nickname
      t.string  :image_url
      t.date    :birth_date
      # 性別
      t.integer :sex,              :null => false
      # 学年
      t.string  :grade
      # 自己紹介
      t.text    :comment

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
