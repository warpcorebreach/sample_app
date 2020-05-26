# valid email regex: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# valid email regex (no '..'' in domain names): /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  # Returns the hash digest of the given string
  def User.digest(str)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(str, cost: cost)
  end
end
