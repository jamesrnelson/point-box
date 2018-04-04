require 'rails_helper'

describe 'Admin visits user show page' do
  it 'should be able to delete user\'s points' do
    admin = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )
    admin.points.create(value: 37)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_user_path(admin)

    expect(page).to have_content('Points: 37')

    click_on 'Delete'

    expect(page).to_not have_content('Points: 37')
    expect(page).to have_content('Points: 0')
  end
end
