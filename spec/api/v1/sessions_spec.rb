require 'rails_helper'

def authenticate(credentials)
  post '/api/v1/sessions', params: credentials
end

RSpec.describe 'registrations', type: :request do
  let(:user_registration) { create(:user_registration) }
  let(:valid_credentials) do
    { email: user_registration.email,
      password: user_registration.password }
  end

  it 'should authenticate' do
    authenticate valid_credentials
    expect_status '201'
  end

  it 'should not authenticate missing user' do
    creds_with_invalid_email = { email: 'missing_user@example.com',
                                 password: user_registration.password,
                                 token_name: 'auth-token-android',
                                 os_type: 'android' }
    authenticate creds_with_invalid_email
    expect_status '401'
  end

  it 'should not authenticate user with wrong password' do
    creds_with_wrong_password = { email: user_registration.email,
                                  password: 'wrong_password' }
    authenticate creds_with_wrong_password
    expect_status '401'
  end

  it 'should destroy session' do
    authenticate valid_credentials
    token = Session.last.token
    delete '/api/v1/sessions',
           headers: { Authorization: token }
    expect_status '200'
  end
end
