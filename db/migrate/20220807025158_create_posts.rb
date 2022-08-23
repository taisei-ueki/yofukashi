class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title,            null: false
      t.text :body,               null: false
      t.string :address,          null: false
      t.integer :user_id,         null: false
      
      t.integer :price_status,    null: false, default: "0"
      t.integer :parking_status,  null: false, default: "0"
      
      t.float :all_rate,          null: false
      t.float :rush_rate,         null: false
      t.float :relax_rate,        null: false
      t.float :beautiful_rate,    null: false
      
      t.timestamps
    end
  end
end
