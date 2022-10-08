class Url < ApplicationRecord
  validates :original, presence: true
  validates :random_id, uniqueness: true
end
