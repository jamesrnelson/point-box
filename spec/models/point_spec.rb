require 'rails_helper'

describe Point, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:value) }
  end
end
