require 'rails_helper'

describe 'User visits their points page' do
  it 'should see all points they\'ve been awarded but not a delete button' do
    user = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test'
    )
    user.points.create(value: 43)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit points_path

    expect(page).to have_content('Points: 43')
    expect(page).to_not have_link('Delete')
  end
end
