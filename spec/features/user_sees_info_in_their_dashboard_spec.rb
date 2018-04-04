require 'rails_helper'

describe 'User visits their dashboard' do
  it 'should display their total points' do
    user1 = User.create!(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test'
    )

    user1.points.create(value: 500)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit user_path(user1)

    expect(page).to have_content('Points available to redeem: 500')
  end
end
