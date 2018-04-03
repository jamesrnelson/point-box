require 'rails_helper'

describe 'User visits rewards index' do
  it 'should display all created rewards' do
    user1 = User.create!(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test'
    )

    reward1 = Reward.create!(
      title: 'thing',
      description: 'it\'s so awesome!'
    )

    reward2 = Reward.create!(
      title: 'thing',
      description: 'it\'s so awesome!'
    )

    visit '/'
    click_on 'Log in'
    fill_in 'E-mail address', with: user1.email
    fill_in 'password', with: user1.password
    click_button 'Log in'

    visit rewards_path

    expect(page).to have_content('All Possible Rewards')
    expect(page).to have_content(reward1.title)
    expect(page).to have_content(reward1.description)
    expect(page).to have_content(reward2.title)
    expect(page).to have_content(reward2.description)
  end
end
