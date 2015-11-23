class User < ActiveRecord::Base
  validates :name,
            presence: true,
            length: {
              in: 3..15
            }
  validates :email,
            presence: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :posts
end
