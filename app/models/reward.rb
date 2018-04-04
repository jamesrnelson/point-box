# Defines the Reward Model
class Reward < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :cost, presence: true
end
