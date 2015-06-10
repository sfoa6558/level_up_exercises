class Book < ActiveRecord::Base
  validates(:title, presence: true)
  has_and_belongs_to_many :users
  has_many :comments
  has_many :recommendations
end
