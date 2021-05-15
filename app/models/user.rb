# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cats, dependent: :destroy
  has_many :photos, dependent: :destroy

  # いいね関連
  has_many :likes, dependent: :destroy
  has_many :liked_photos, through: :likes, source: :photo

  validates :user_name, presence: true, length: { minimum: 4, maximum: 32 }
  validates :user_profile, allow_blank: true, length: { maximum: 255 }

  # パスワードは半角英数字混合での入力が必須
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', on: :create
end
