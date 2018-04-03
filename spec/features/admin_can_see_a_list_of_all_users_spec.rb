require 'rails_helper'

describe 'Admin' do
  scenario 'visits users index and sees all users' do
    user1 = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )
    user2 = User.create(
      name: 'Ahighat',
      email: 'ahighat@gmail.com',
      password: 'test'
    )
    user3 = User.create(
      name: 'Sasha',
      email: 'sasha@gmail.com',
      password: 'test'
    )

    visit '/'

    click_on 'Log in'

    fill_in 'E-mail address', with: user1.email
    fill_in 'password', with: user1.password
    click_button 'Log in'

    visit '/admin/users'

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(user2.email)
    expect(page).to have_content(user3.name)
    expect(page).to have_content(user3.email)
  end
end

describe 'Default User' do
  scenario 'is not allowed to see admin users index' do
    user = User.create(
      name: 'Joseph',
      email: 'jpriley@gmail.com',
      password: 'password',
      role: 0
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_users_path
    expect(page).to_not have_content(user.name)
    expect(page).to have_content('The page you were looking for doesn\'t exist.')
  end
end
