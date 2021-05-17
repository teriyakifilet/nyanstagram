class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  with_options presence: true do
    validates :user_id, :cat_id
  end
end
