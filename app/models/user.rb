class User < ApplicationRecord
  has_many :tweets
  validates :uid, presence: true, uniqueness: true
end