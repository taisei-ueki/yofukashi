class PostPlaceRelation < ApplicationRecord
  belongs_to :post
  belongs_to :place
end
