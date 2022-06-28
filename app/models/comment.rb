class Comment < ApplicationRecord
  belongs_to :facepost
  belongs_to :user
  validates :comment, presence: true
end
