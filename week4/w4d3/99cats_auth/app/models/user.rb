
class User < ActiveRecord::Base
  validates :user_name, :password_digest, presence: true
  validates :session_token, uniqueness: true
  
  # after_initialize (set the token if it's not already set)
  has_many(
    :cats,
    class_name: "Cat",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :requests,
    class_name: "CatRentalRequest",
    foreign_key: :user_id,
    primary_key: :id
  )

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    self.save!
    self.password_digest
  end

#how does is_password work?
  def is_password?(password)
    db_pw = BCrypt::Password.new(self.password_digest)
    db_pw.is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

end
