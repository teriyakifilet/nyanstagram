# frozen_string_literal: true

class Cat < ApplicationRecord
  belongs_to :user
  has_one_attached :icon

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cat_sex
  belongs_to :cat_breed

  with_options numericality: { other_than: 1 } do
    validates :cat_sex_id, :cat_breed_id
  end

  with_options presence: true do
    validates :cat_name, :icon
  end

  validates :cat_age, numericality: { only_integer: true }, allow_blank: true
end
