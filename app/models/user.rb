class User < ApplicationRecord
  validates :first_name, :last_name, :password_digest,
            :session_token, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  after_initialize :ensure_session_token
  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.new(password)
  end

  def is_password?(password)
    BCrypt::Password.create(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    if @user && @user.is_password?(password)
      @user
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end


end
