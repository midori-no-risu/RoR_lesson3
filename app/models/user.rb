class User < ActiveRecord::Base
  validates :name,
            presence: true,
            length: {
              in: 3..25
            }

  validates :email,
            presence: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validate  :image_size

  has_secure_password
  has_many :posts, dependent: :destroy
  mount_uploader :image, ImageUploader

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, 'should be less than 5MB')
      end
    end
end
