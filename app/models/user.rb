class User < ApplicationRecord
  mount_uploader: image, ImageUploader
  before_validation { email.downcase! }
  validates :name, length: { maximum: 20 }
  validates :email,
    presence: true,
    length: { maximum: 50 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: true
  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 8, maximum: 16 },
    format: { with: /\A[a-z\d]{8,16}+\z/i }
  has_many :pictures, dependent: :destroy
end
