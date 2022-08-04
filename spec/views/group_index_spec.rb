require 'rails_helper'

RSpec.describe 'Group Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Juancho', email: 'juans@juans.com', password: '123456', password_confirmation: '123456')
    @user.save!
    sign_in @user
    (1..5).each do |id|
      Group.create(user: @user, name: "Group #{id}", icon: '🍔')
    end
    visit groups_path
  end

  it 'should render the correct text' do
    expect(page).to have_content('Group 1')
    expect(page).to have_content('Group 2')
    expect(page).to have_content('Group 3')
    expect(page).to have_content('Group 4')
    expect(page).to have_content('Group 5')
  end

  it 'when click on a group, should lead to the correct page' do
    click_link 'Group 1'
    expect(current_path).to eq(group_path(Group.first))
  end

  it 'should have a link to add a new group' do
    expect(page).to have_link('Add Category')
  end

  it 'new category link should lead to new group page' do
    click_link('Add Category')
    expect(current_path).to eq(new_group_path)
  end
end
