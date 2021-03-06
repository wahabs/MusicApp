class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: { message: "can't be blank" }
  after_initialize :ensure_session_token
  has_many :notes

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user.nil?
      nil
    else
      (user.is_password?(password)) ? user : nil
    end
  end

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  private

    def ensure_session_token
      self.session_token ||= generate_session_token
    end

    def generate_session_token
      SecureRandom::urlsafe_base64
    end

end
