class User < ActiveRecord::Base
  before_save {self.email=email.downcase}
  has_secure_password
  validates :email, format: { with: /\A[^@]+@[^@]+\z/}, uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: {maximum: 30}
end
