require 'rails_helper'

RSpec.describe 'Login & Sign-up', type: :system do
  it 'the email and password inputs and the "log in" button' do
    visit '/users/sign_in'
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_button('Log in')
  end

  it 'the full name and password inputs and the "sign up" button' do
    visit '/users/sign_up'
    expect(page).to have_field('Full Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password - 6 characters minimum')
    expect(page).to have_field('Confirm password')
    expect(page).to have_button('Sign up')
  end
end