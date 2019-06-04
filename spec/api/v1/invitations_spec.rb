require 'rails_helper'

RSpec.describe 'project_users', type: :request do
  let(:user) { create(:user_registration) }
  let(:guest_user) { create(:user_registration) }
  let(:session) { Session.create(user: user) }
  let(:project) { create(:project) }

  it 'should invite user' do
    ProjectUser.create(user: user, project: project, user_role: 0)
    post '/api/v1/invite',
         params: {
           project_id: project.id,
           email: 'sample@email.com',
           user_role: 1
         },
         headers: { Authorization: session.token }
    expect_status '201'
  end

  it 'should accept invitation' do
    ProjectUser.create(user: user, project: project, user_role: 0)
    user = User.invite!(email: 'sample@email.com', skip_invitation: true)
    post '/api/v1/accept_invitation',
         params: {
           invitation_token: user.invitation_token,
           password: 'password123',
           password_confirmation: 'password123'
         },
         headers: { Authorization: session.token }
    expect_status '201'
  end
end
