class Post < ApplicationRecord
  validates :tittle, presence: true, length: { minimum:5 }
  validates :body, presence: true
end
