class User < ActiveRecord::Base
  has_many :posts
  has_many :users #追蹤者
  belongs_to :user #使用者追蹤的人
  
  has_many :out_followings, class_name: "Following", foreign_key: :from_id, dependent: :destroy
  has_many :followed_users, class_name: "User", through: :out_followings, source: :to
  has_many :in_followings, class_name: "Following", foreign_key: :to_id, dependent: :destroy
  has_many :followers, class_name: "User", through: :in_followings, source: :from
  before_save {self.email=email.downcase}
  before_save { self.session_token ||= Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s) }
  has_secure_password
  validates :email, format: { with: /\A[^@]+@[^@]+\z/}, uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: {maximum: 30}
  
  #設定關注
  def follow(user)
    out_followings.create(to_id: user.id)
  end
  
  #取消關注
  def unfollow(user)
    following = out_followings.find_by(to_id: user.id)
	if following
	  following.destroy
	  true
	else
	  false
	end
  end
  
  def following?(user)
    followed_users.exists?(user.id)
  end
  
  def followed_by?(user)
    followers.exists?(user.id)
  end
end
