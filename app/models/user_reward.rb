class UserReward < ApplicationRecord
  validates :user_id, presence: true
  validates :reward_id, presence: true
end
