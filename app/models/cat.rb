# frozen_string_literal: true

class Cat < ApplicationRecord
  has_many :cat_photos, dependent: :destroy
  has_many :photos, through: :cat_photos
  belongs_to :user
  has_one_attached :icon

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cat_sex
  belongs_to :cat_breed

  with_options numericality: { other_than: 1, message: 'を選んでください' } do
    validates :cat_sex_id, :cat_breed_id
  end

  validates :cat_name, presence: true
  validates :icon, presence: { message: 'を選んでください' }

  validates :cat_age, numericality: { only_integer: true }, allow_blank: true

  # フォロー関連
  has_many :relationships
  has_many :followers, through: :relationships, source: :user

  def followed_by?(user)
    relationships.where(user_id: user.id).exists?
  end
end
