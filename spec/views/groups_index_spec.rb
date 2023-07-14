require 'rails_helper'

RSpec.describe 'Groups Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'User', email: 'mail@mail.com', password: '112233', password_confirmation: '112233')
    @category1 = Group.create(name: 'group1', icon: 'oneIcon.svg', user_id: @user.id)
    @category2 = Group.create(name: 'group2', icon: 'twoIcon.svg', user_id: @user.id)
    # creates a group not owned by the user
    @category3 = Group.create(name: 'group3', icon: 'twoIcon.svg', user_id: @user.id + 1)
    visit unauthenticated_root_path
    click_on(id: 'login')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on(id: 'login-btn')
  end

  it 'Shows categories text' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'Has new category button' do
    expect(page).to have_selector('#newGroupBtn')
  end

  it 'Has log out Button' do
    expect(page).to have_selector('#logoutBtn')
  end

  it 'Has the proper categories shown' do
    expect(page).to have_selector('.grouP', count: 2)
  end
end
