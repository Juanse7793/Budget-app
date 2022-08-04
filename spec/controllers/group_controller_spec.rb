require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :request do
  before(:each) do
    @user = User.create(name: 'Juan', email: 'juan@juan.com', password: '123456', password_confirmation: '123456')
    sign_in @user
    Group.create(user: @user, name: 'test', icon: 'test')
  end

  describe 'GET /index' do
    before { get groups_path }

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the correct text' do
      expect(response.body).to include('test')
    end
  end
end
