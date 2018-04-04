# Defines user model
class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :points

  enum role: %w[default admin]

  def self.total_points(id)
    joins(:points).where(id: id).sum(:value)
  end
end
