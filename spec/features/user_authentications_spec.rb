require 'rails_helper'

describe 'User' do
  scenario 'logs in successfully' do
    user = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    click_on 'Log in'
    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page).to have_content("Welcome, #{user.name}")
    expect(current_path).to eq(user_path(user))
  end

  scenario 'can log out' do
    user = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    click_on 'Log in'
    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    click_on 'Log out'

    expect(current_path).to eq(logout_path)
  end
end
