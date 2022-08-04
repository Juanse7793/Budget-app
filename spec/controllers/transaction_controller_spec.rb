require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :request do
    before(:each) do
        @user = User.create(name: 'test', email: 'test@test.com', password: 'testtest')
        sign_in @user
        @group = Group.create(name: 'test', icon: 'test', user: @user)
        @transaction = Transaction.create(name: 'test', amount: 800, group: @group, user: @user)
    end

    describe 'GET /transactions' do
        before { get group_path(@group) }

        it 'returns a 200 status code' do
            expect(response).to have_http_status(200)
        end

        it 'renders the index template' do
            expect(response).to render_template('show')
        end

        it 'should render the correct text' do
            expect(response.body).to include('test')
        end
    end
end