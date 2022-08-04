require 'rails_helper'
require 'spec_helper'

RSpec.describe Group, type: :model do
  it 'is not valid just with a name' do
    group = Group.new(name: 'test')
    expect(group).to_not be_valid
  end
  it 'is invalid without a name' do
    group = Group.new(name: nil)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a name and icon' do
    group = Group.new(name: 'test', icon: 'test')
    expect(group).to_not be_valid
  end
  it 'is invalid without a icon' do
    group = Group.new(icon: nil)
    group.valid?
    expect(group.errors[:icon]).to include("can't be blank")
  end

  it 'is valid with a name, icon, and user' do
    user = User.create(name: 'test', email: 'test@test.com', password: 'testtest')
    group = Group.new(name: 'test', icon: 'test', user:)
    expect(group).to be_valid
  end
end
