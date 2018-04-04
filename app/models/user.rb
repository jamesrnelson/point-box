# Defines user model
class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :points
  has_many :user_rewards
  has_many :rewards, through: :user_rewards

  enum role: %w[default admin]

  def total_points
    points.sum(:value)
  end

  def self.alphabetize
    order(:name)
  end
end
