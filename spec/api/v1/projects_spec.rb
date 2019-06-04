require 'rails_helper'

def authenticate(credentials)
  post '/api/v1/sessions', params: credentials
end

RSpec.describe 'projects', type: :request do
  let(:user) { create(:user_registration) }
  let(:session) { Session.create(user: user) }

  it 'should create project' do
    post '/api/v1/projects',
         params: { name: 'Test Project' },
         headers: { Authorization: session.token }
    expect_status '201'
  end

  it 'should not create project without authorization' do
    post '/api/v1/projects',
         params: { name: 'Test Project' }
    expect_status '401'
  end
end
