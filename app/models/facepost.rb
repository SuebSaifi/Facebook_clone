class Facepost < ApplicationRecord
belongs_to :user
has_many :likes
has_many :comments
# def liked?
#    !!self.likes.find{|like| like.user_id==user.id}
# end
end