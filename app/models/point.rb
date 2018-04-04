# Defines Point Model behavior
class Point < ApplicationRecord
  validates :value, presence: true
  validates :description, presence: true
  belongs_to :user
end
