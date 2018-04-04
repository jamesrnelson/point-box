require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'roles' do
    it 'can be created as an admin' do
      user = User.create(
        name: 'penelope',
        email: 'penelope@gmail.com',
        password: 'boom',
        role: 1
      )

      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end

    it 'can be created as a default user' do
      user = User.create(
        name: 'sammy',
        email: 'sammy@gmail.com',
        password: 'pass',
        role: 0
      )

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end

  describe 'Total Points' do
    it 'sums the value of all of a user\'s points' do
      user = User.create(
        name: 'sammy',
        email: 'sammy@gmail.com',
        password: 'pass',
        role: 0
      )

      user.points.create(value: 20)
      user.points.create(value: 30)

      expect(user.total_points).to eq(50)
    end
  end

  describe 'Alphabetize' do
    it 'arranges Users alphabetically' do
      user1 = User.create(
        name: 'sammy',
        email: 'sammy@gmail.com',
        password: 'pass',
        role: 0
      )

      user2 = User.create(
        name: 'penelope',
        email: 'penelope@gmail.com',
        password: 'boom',
        role: 0
      )

      expect(User.alphabetize.first.name).to eq('penelope')
    end
  end
end
