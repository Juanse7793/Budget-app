require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, and password' do
    user = User.new(
      name: 'test',
      email: 'test@test.com',
      password: 'testtest'
    )
    expect(user).to be_valid
  end
  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  it 'is invalid without an email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it 'is invalid without a password' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
  it 'is invalid with a duplicate email address' do
    User.create(
      name: 'test',
      email: 'test@test.com',
      password: 'testtest'
    )
    user = User.new(
      name: 'test',
      email: 'test@test.com',
      password: 'testtest'
    )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end
  it 'is invalid with a password that has less than 6 characters' do
    user = User.new(password: 'test')
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
  end
end
