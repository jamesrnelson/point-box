require 'rails_helper'

describe 'User' do
  scenario 'clicks on create new account, fills in info, and submits' do
    user = User.new(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'testpass'
    )

    visit '/'

    click_on 'Create New Account'
    fill_in 'Name', with: user.name
    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Create Account'

    expect(page).to have_content('Thanks for making an account! Log in now to see what all the fuss is about!')
  end

  scenario 'cannot create account if email address already exists' do
    user = User.create!(
      name: 'Ahighat',
      email: 'ahighat@gmail.com',
      password: 'testpass'
    )

    visit '/'

    click_on 'Create New Account'
    fill_in 'Name', with: user.name
    fill_in 'E-mail address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Create Account'

    expect(page).to have_button('Create Account')
    expect(current_path).to eq(new_user_path)
  end
end
