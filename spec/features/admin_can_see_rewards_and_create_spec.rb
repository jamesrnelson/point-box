require 'rails_helper'

describe 'Admin goes to rewards index' do
  it 'should display rewards and be able to create rewards' do
    admin = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_rewards_path

    click_on 'Create New Reward'

    fill_in 'Title', with: 'A cool thing'
    fill_in 'Description', with: 'So cool that everybody wants it.'
    click_on 'Create Reward'

    expect(current_path).to eq(admin_rewards_path)
    expect(page).to have_content('A cool thing')
    expect(page).to have_content('So cool that everybody wants it.')
  end
end
