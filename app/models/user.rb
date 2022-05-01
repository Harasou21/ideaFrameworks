class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true,
                    length:   { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    length:     { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engin::MIN_COST : BCrypt::Engin.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
