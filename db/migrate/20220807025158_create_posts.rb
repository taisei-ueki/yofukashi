class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title,            null: false, default: ""
      t.text :body,               null: false, default: ""
      t.string :address,          null: false, default: ""
      t.integer :user_id,         null: false, default: ""
      
      t.integer :price_status,    null: false, default: "0"
      t.integer :parking_status,  null: false, default: "0"
      
      t.float :all_rate,          null: false, default: ""
      t.float :rush_rate,         null: false, default: ""
      t.float :relax_rate,        null: false, default: ""
      t.float :beautiful_rate,    null: false, default: ""
      
      t.timestamps
    end
  end
end
