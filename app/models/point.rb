# Defines Point Model behavior
class Point < ApplicationRecord
  validates :value, presence: true
  belongs_to :user
end
