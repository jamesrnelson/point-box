require 'rails_helper'

describe 'Admin' do
  scenario 'visits users index and sees all users' do
    user1 = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test'
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

    visit '/admin/users'

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(user2.email)
    expect(page).to have_content(user3.name)
    expect(page).to have_content(user3.email)
  end
end
