class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true #確認使用者user_id這欄位資料是否存在
  validates :content, presence: true, length: { maximum: 140 } #內容是否為空白，長度140以內
end
