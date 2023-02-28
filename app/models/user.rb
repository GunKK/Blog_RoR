class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  has_many :friendships
  has_many :friend, through: :friendships

  #check current_user and orther user are friend?
  def friend_with?(other_user)
    friendships.find_by(friend_id: other_user.id)
  end
end