class Photo < ApplicationRecord
  has_many :cat_photos
  has_many :cats, through: :cat_photos
  has_one_attached :cat_photo
end
