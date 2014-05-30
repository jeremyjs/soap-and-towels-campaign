class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :uniqueness => true,
            :format => { with: VALID_EMAIL_REGEX },
            :length => { :maximum => 100 }

  has_secure_password
  validates :password, :presence => true, :length => { in: 8..40 }


end
