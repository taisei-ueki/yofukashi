class PostJenreRelation < ApplicationRecord
  belongs_to :post
  belongs_to :jenre
end
