require 'rails_helper'


describe 'Admin Sees and Creates Rewards' do
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
    fill_in 'Cost', with: 75
    click_on 'Create Reward'

    expect(current_path).to eq(admin_rewards_path)
    expect(page).to have_content('A cool thing')
    expect(page).to have_content('So cool that everybody wants it.')
  end
end

describe 'Admin tries to use incomplete information when creating new reward' do
  it 'should redirect to the new point path' do
    admin = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_rewards_path

    click_on 'Create New Reward'

    fill_in 'Title', with: nil
    fill_in 'Description', with: 'So cool that everybody wants it.'
    fill_in 'Cost', with: '75'
    click_on 'Create Reward'

    expect(current_path).to eq(new_admin_reward_path)
    expect(page).to have_content('Create a New Reward')
  end
end

describe 'Admin Edits Rewards' do
  it 'should be able to edit rewards' do
    reward1 = Reward.create!(
      title: 'best thing',
      description: 'truly the best',
      cost: '80'
    )

    admin = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_rewards_path

    expect(page).to have_content(reward1.title)
    expect(page).to have_content(reward1.description)

    click_on 'Edit'

    fill_in 'Title', with: 'worst thing'
    fill_in 'Description', with: 'no one wants it'
    fill_in 'Cost', with: '2'
    click_on 'Update Reward'

    expect(page).to_not have_content(reward1.title)
    expect(page).to_not have_content(reward1.description)
    expect(page).to have_content('worst thing')
    expect(page).to have_content('no one wants it')
  end
end

describe 'Admin Deletes Rewards' do
  it 'should be able to delete rewards' do
    reward1 = Reward.create!(
      title: 'best thing',
      description: 'truly the best',
      cost: '80'
    )

    admin = User.create(
      name: 'Jimmy',
      email: 'nelson.jimmy@gmail.com',
      password: 'test',
      role: 1
    )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_rewards_path

    expect(page).to have_content(reward1.title)
    expect(page).to have_content(reward1.description)

    click_on 'Delete'

    expect(current_path).to eq(admin_rewards_path)
    expect(page).to_not have_content(reward1.title)
    expect(page).to_not have_content(reward1.description)
  end
end
