require 'rails_helper'

RSpec.describe 'project_users', type: :request do
  let(:user) { create(:user_registration) }
  let(:guest_user) { create(:user_registration) }
  let(:session) { Session.create(user: user) }
  let(:project) { create(:project) }

  it 'should give access' do
    ProjectUser.create(user: user, project: project, user_role: 0)
    post '/api/v1/user_projects',
         params: {
           project_id: project.id,
           user_id: guest_user.id,
           user_role: 1
         },
         headers: { Authorization: session.token }
    expect_status '201'
  end

  it 'should change role' do
    ProjectUser.create(user: user, project: project, user_role: 0)
    project_user = ProjectUser.create(user: guest_user, project: project, user_role: 1)
    put '/api/v1/user_projects',
         params: {
           id: project_user.id,
           user_role: 2
         },
         headers: { Authorization: session.token }
    expect_status '200'
  end

  it 'should remove access' do
    ProjectUser.create(user: user, project: project, user_role: 0)
    project_user = ProjectUser.create(user: guest_user, project: project, user_role: 1)
    delete '/api/v1/user_projects',
         params: {
           id: project_user.id,
         },
         headers: { Authorization: session.token }
    expect_status '200'
  end

  it 'should not give access without permissions' do
    post '/api/v1/user_projects',
         params: {
           project_id: project.id,
           user_id: guest_user.id,
           user_role: 1
         },
         headers: { Authorization: session.token }
    expect_status '403'
  end
end
