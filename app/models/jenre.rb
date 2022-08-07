class Jenre < ApplicationRecord
  
  #Jenresテーブルから中間テーブルに対する関連付け
  has_many :post_jenre_relations, dependent: :destroy
  #Jenresテーブルから中間テーブルを介してPostテーブルへの関連付け
  has_many :posts, through: :post_jenre_relations, dependent: :destroy
  
end
