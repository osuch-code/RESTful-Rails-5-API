class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  # Validates - presenec = required fields
end
