require 'rails_helper'

RSpec.describe 'Groups New', type: :feature do
  before(:each) do
    @user = User.create(name: 'User', email: 'mail@mail.com', password: '112233', password_confirmation: '112233')
    @category1 = Group.create(name: 'group1', icon: 'oneIcon.svg', user_id: @user.id)
    @category2 = Group.create(name: 'group2', icon: 'twoIcon.svg', user_id: @user.id)
    # creates a group not owned by the user
    @category3 = Group.create(name: 'group3', icon: 'twoIcon.svg', user_id: @user.id+1)
    visit unauthenticated_root_path
    click_on(id: 'login')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on(id: 'login-btn')
    visit new_group_path
  end

  it 'Has new group title' do
    expect(page).to have_content("NEW CATEGORY")
  end

  it 'Has group name input' do
    expect(page).to have_selector('#groupNameInput')
  end

  it 'Shows user four icons' do
    expect(page).to have_selector('.iconSelect', count: 4)
  end

  it 'has Create Group button' do
    expect(page).to have_selector('.createGroupBtn', count: 1)
  end
end