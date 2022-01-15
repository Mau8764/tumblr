class Post < ApplicationRecord
  has_many :comments
  validates :tittle, presence: true, length: { minimum:5 }
  validates :body, presence: true
end
