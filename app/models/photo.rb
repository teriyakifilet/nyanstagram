class Photo < ApplicationRecord
  has_many :cat_photos
  has_many :cats, through: :cat_photos
  has_one_attached :cat_photo
  belongs_to :user

  with_options presence: true do
    validates :cat_ids, :cat_photo
  end
end
