class User < ActiveRecord::Base
  has_many :jars
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid"}
  validates :name, presence: true

end