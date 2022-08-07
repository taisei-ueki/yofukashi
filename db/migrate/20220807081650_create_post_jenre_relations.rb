class CreatePostJenreRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_jenre_relations do |t|
      t.references :post,  null: false, foreign_key: true
      t.references :jenre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
