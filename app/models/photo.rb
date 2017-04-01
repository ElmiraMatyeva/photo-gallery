class Photo < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, 
  content_type: { content_type: ["image/jpg", "image/png"] }
  
  belongs_to :user
  has_many :feedbacks, through: :users
  validates :user_id, presence: true
end
