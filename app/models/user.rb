class User < ActiveRecord::Base
  validates :password_digest, presence: {message: "password cannot be blank"}
  validates :email, uniqueness: true, presence: true
  validates :session_token, uniqueness: true, presence: true
  after_initialize :ensure_session_token

  def self.generate_session_token
    token = SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    unless user.nil?
      if user.is_password?(password)
        user
      end
    end
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    @session_token = self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token

  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_digest = @password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end


end
