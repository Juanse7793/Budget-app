require 'rails_helper'

RSpec.describe 'Group Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Juancho', email: 'juans@juans.com', password: '123456', password_confirmation: '123456')
    @user.save!
    sign_in @user

    @group = Group.create(user: @user, name: 'Food', icon: '🍔')

    (1..5).each do |id|
      @group.transactions.create(
        user: @user,
        name: "transaction #{id}",
        amount: 100
      )
    end

    visit group_path(@group)
  end

  it 'when click on the group name, should lead to the edit group page' do
    click_link 'Food'
    expect(current_path).to eq(edit_group_path(@group))
  end

  it 'should render the correct text' do
    expect(page).to have_content('transaction 1')
    expect(page).to have_content('transaction 2')
    expect(page).to have_content('transaction 3')
    expect(page).to have_content('transaction 4')
    expect(page).to have_content('transaction 5')
  end

  it 'when click on a transaction, should lead to the correct page' do
    click_link 'transaction 1'
    expect(current_path).to eq(edit_group_transaction_path(@group, Transaction.first))
  end

  it 'should have a link to add a new transaction' do
    expect(page).to have_link('New Transaction')
  end

  it 'new transaction link should lead to new transaction page' do
    click_link('New Transaction')
    expect(current_path).to eq(new_group_transaction_path(@group))
  end
end
