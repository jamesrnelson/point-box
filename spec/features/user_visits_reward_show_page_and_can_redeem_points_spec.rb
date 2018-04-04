require 'rails_helper'

describe 'User visits reward show page' do
  it 'should be able to redeem their points if they have enough' do
    user1 = User.create!(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test'
    )

    reward1 = Reward.create!(
      title: 'thing1',
      description: 'it\'s so awesome!',
      cost: '80'
    )

    user1.points.create(value: 90)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit reward_path(reward1)

    expect(page).to have_content('Your points available to redeem: 90')

    click_on 'Redeem 80 of your 90 points to acquire this reward.'

    expect(current_path).to eq(rewards_path)
    expect(page).to have_content('Your points available to redeem: 10')
    expect(page).to have_content('You have acquired a reward!')
  end
end

describe 'User visits reward show page' do
  it 'should NOT be able to redeem their points if they do NOT have enough' do
    user1 = User.create!(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test'
    )

    reward1 = Reward.create!(
      title: 'thing1',
      description: 'it\'s so awesome!',
      cost: '80'
    )

    user1.points.create(value: 70)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit reward_path(reward1)
    expect(page).to have_content('Your points available to redeem: 70')
    expect(page).to have_content('You do not have enough points to acquire this reward.')
    expect(page).to_not have_link('Redeem 80 of your 70 points to acquire this reward.')
  end
end
