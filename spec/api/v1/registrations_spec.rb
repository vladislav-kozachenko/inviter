require 'rails_helper'

RSpec.describe 'registrations', type: :request do
  let(:user_registration) { build(:user_registration) }
  let(:params) do
    { email: user_registration.email,
      password: user_registration.password,
      password_confirmation: user_registration.password }
  end

  it 'should create new user' do
    post '/api/v1/registration', params: params
    expect_status '201'
  end

  it 'should reject registration of user with invalid email' do
    post '/api/v1/registration', params: { email: '123',
                                           password: user_registration.password,
                                           password_confirmation: user_registration.password }
    expect_status '406'
  end

  it 'email should be unique' do
    post '/api/v1/registration', params: params
    post '/api/v1/registration', params: params
    expect_status '406'
  end
end
