class CatPhoto < ApplicationRecord
  belongs_to :cat
  belongs_to :photo
end
