class Category < ApplicationRecord
  
  #Categoriesテーブルから中間テーブルに対する関連付け
  has_many :post_category_relations, dependent: :destroy
  #Categoriesテーブルから中間テーブルを介してPostテーブルへの関連付け
  has_many :posts, through: :post_category_relations, dependent: :destroy
  
end
