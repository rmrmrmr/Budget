require 'rails_helper'

RSpec.describe 'Groups show', type: :feature do
  before(:each) do
    @user = User.create(name: 'User', email: 'mail@mail.com', password: '112233', password_confirmation: '112233')
    @category1 = Group.create(name: 'group1', icon: 'oneIcon.svg', user_id: @user.id)
    @category2 = Group.create(name: 'group2', icon: 'twoIcon.svg', user_id: @user.id)
    @item1 = Item.create(name: 'itemOne', amount: 10, user_id: @user.id, group_id: @category1.id)
    @item2 = Item.create(name: 'itemTwo', amount: 20, user_id: @user.id, group_id: @category1.id)
    # creates a group not owned by the user
    @category3 = Group.create(name: 'group3', icon: 'twoIcon.svg', user_id: @user.id+1)
    # creates an item not owned by the user
    @item3 = Item.create(name: 'itemThree', amount: 30, user_id: @user.id+1, group_id: @category3.id)
    visit unauthenticated_root_path
    click_on(id: 'login')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on(id: 'login-btn')
    visit group_path(id: @category1.id)
  end

  it 'Has transactions title' do
    expect(page).to have_content('TRANSACTIONS')  
  end

  it 'Has name of Items' do
    expect(page).to have_content('itemOne')  
    expect(page).to have_content('itemTwo')  
  end

  it 'displays the correct amount of each item' do
    expect(page).to have_content('10.0')
    expect(page).to have_content('20.0')
  end

  it 'displays the correct total amount' do
    expect(page).to have_content('30.0')  
  end
end