require 'rails_helper'
require 'spec_helper'

RSpec.describe Transaction, type: :model do
  it 'is not valid just with a name' do
    transaction = Transaction.new(name: 'test')
    expect(transaction).to_not be_valid
  end
  it 'is invalid without a name' do
    transaction = Transaction.new(name: nil)
    transaction.valid?
    expect(transaction.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a name and amount' do
    transaction = Transaction.new(name: 'test', amount: 800)
    expect(transaction).to_not be_valid
  end
  it 'is invalid without a amount' do
    transaction = Transaction.new(amount: nil)
    transaction.valid?
    expect(transaction.errors[:amount]).to include("can't be blank")
  end

  it 'is invalid with a name, amount, and group' do
    group = Group.create(name: 'test', icon: 'test')
    transaction = Transaction.new(name: 'test', amount: 800, group:)
    expect(transaction).to_not be_valid
  end

  it 'is valid with a name, amount, group and user' do
    user = User.create(name: 'test', email: 'test@test.com', password: 'testtest')
    group = Group.create(name: 'test', icon: 'test', user:)
    transaction = Transaction.new(name: 'test', amount: 800, group:, user:)
    expect(transaction).to be_valid
  end
end
