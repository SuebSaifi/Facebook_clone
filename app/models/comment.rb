class Comment < ApplicationRecord
  belongs_to :facepost
  belongs_to :user
end
