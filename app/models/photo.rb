class Photo < ApplicationRecord
  has_many :cat_photos, dependent: :destroy
  has_many :cats, through: :cat_photos
  has_one_attached :cat_photo
  belongs_to :user
  # いいね関連
  has_many :likes
  has_many :users, through: :likes

  with_options presence: true do
    validates :cat_ids, :cat_photo
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
