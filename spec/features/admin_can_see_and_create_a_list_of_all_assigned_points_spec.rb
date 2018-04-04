require 'rails_helper'

describe 'Admin visits points index' do
  it 'should be able to add and see assigned points on points index' do
    admin = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_points_path

    click_on 'Assign Points'

    fill_in 'Value', with: 30
    select(admin.email, from: 'point[user_id]')
    click_on 'Assign Points'

    click_on 'Assign Points'

    fill_in 'Value', with: 20
    select(admin.email, from: 'point[user_id]')
    click_on 'Assign Points'

    expect(current_path).to eq(admin_points_path)
    expect(page).to have_content('Points: 50')
  end
end

describe 'Admin doesn\'t give fill in point value' do
  it 'should redirect admin to assign points path' do
    admin = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit new_admin_point_path

    fill_in 'Value', with: nil
    select(admin.email, from: 'point[user_id]')
    click_on 'Assign Points'

    expect(current_path).to eq(new_admin_point_path)
    expect(page).to have_content('You must select a point value.')
  end
end
