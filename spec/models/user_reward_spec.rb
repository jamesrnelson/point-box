require 'rails_helper'

describe UserReward, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:reward_id) }
  end
end
