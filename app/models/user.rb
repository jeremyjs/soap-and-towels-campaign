class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :uniqueness => true,
            :format => { with: VALID_EMAIL_REGEX },
            :length => { :maximum => 100 }

  has_secure_password
  validates :password, :presence => true, :length => { in: 8..40 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
