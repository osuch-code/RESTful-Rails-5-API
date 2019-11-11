class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :superhero, presence: true
  # Validates - presence = required fields
end
