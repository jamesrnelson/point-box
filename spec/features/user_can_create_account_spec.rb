require 'rails_helper'

describe 'User' do
  scenario 'clicks on create new account, fills in info, and submits' do
    user = User.new(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    click_on 'Create a New Account'
    fill_in 'Name', with: user.name
    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Create Account'

    expect(page).to have_content("Welcome, #{user.name}")
  end
end
