class Photo < ApplicationRecord
  has_many :cat_photos, dependent: :destroy
  has_many :cats, through: :cat_photos
  has_one_attached :cat_photo
  belongs_to :user
  # いいね関連
  has_many :likes
  has_many :users, through: :likes

  validates :cat_photo, presence: { message: 'を選んでください' }
  validates :cat_ids, presence: { message: 'を選んでください' }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
