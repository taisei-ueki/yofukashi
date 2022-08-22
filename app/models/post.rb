class Post < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # jenreテーブルへの関連付け
  has_many :post_jenre_relations, dependent: :destroy
  has_many :jenres, through: :post_jenre_relations, dependent: :destroy
  
   # placeテーブルへの関連付け
  has_many :post_place_relations, dependent: :destroy
  has_many :places, through: :post_place_relations, dependent: :destroy
  
   # categoryテーブルへの関連付け
  has_many :post_category_relations, dependent: :destroy
  has_many :categories, through: :post_category_relations, dependent: :destroy
  
  validates :title,presence:true
  validates :body, presence:true,length:{maximum:200}
  
  has_many_attached :main_images
  
  def favorited_by?(user)
      favorites.exists?(user_id: user.id)
  end
  
  def self.search(search)
   if search != ""
     Post.where(['address LIKE(?) OR title LIKE(?)',"%#{search}%","%#{search}%"]) 
   else
     Post.all
   end
  end
  
  def self.create_favorite_ranks #Noteクラスからデータを取ってくる処理なのでクラスメソッド！
    Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end
  
  def self.create_comment_ranks 
    Post.find(PostComment.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end
  
 
  
end
