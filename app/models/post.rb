class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true #確認使用者user_id這欄位資料是否存在
  validates :content, presence: true, length: { maximum: 140 } #內容是否為空白，長度140以內
  
  def self.from_followed_users(user)
		where("user_id IN (SELECT to_id FROM followings WHERE from_id = :user_id) OR user_id = :user_id", user_id: user.id)
  end
end
