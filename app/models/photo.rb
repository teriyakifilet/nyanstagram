class Photo < ApplicationRecord
  has_one_attached :cat_photo
  has_many :cats, through: :cat_photos
end
