# Defines Point Model behavior
class Point < ApplicationRecord
  validates :value, presence: true
end
