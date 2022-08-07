class Place < ApplicationRecord
  
  #Placesテーブルから中間テーブルに対する関連付け
  has_many :post_place_relations, dependent: :destroy
  #Placesテーブルから中間テーブルを介してPostテーブルへの関連付け
  has_many :posts, through: :post_place_relations, dependent: :destroy
  
end
