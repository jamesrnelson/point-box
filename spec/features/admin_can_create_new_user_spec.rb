require 'rails_helper'

describe 'Admin visits admin_users_path and clicks Create New User' do
  it 'should be able to create a new user' do
    admin = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    click_on 'Create New User'

    fill_in 'Name', with: 'Horatio'
    fill_in 'E-mail address', with: 'hh@gmail.com'
    fill_in 'Password', with: 'test'
    select('admin', from: 'user[role]')
    click_on 'Create Account'

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content('Horatio - hh@gmail.com')
  end
end
