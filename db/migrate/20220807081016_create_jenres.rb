class CreateJenres < ActiveRecord::Migration[6.1]
  def change
    create_table :jenres do |t|
      t.string :name,  null: false

      t.timestamps
    end
  end
end
