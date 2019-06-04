require 'rails_helper'

RSpec.describe 'projects', type: :request do
  let(:user) { create(:user_registration) }
  let(:session) { Session.create(user: user) }
  let(:project) { create(:project) }

  it 'should create project' do
    post '/api/v1/projects',
         params: { name: 'Test Project' },
         headers: { Authorization: session.token }
    expect_status '201'
  end

  it 'should delete project' do
    post '/api/v1/projects',
         params: { name: 'Sample Project' },
         headers: { Authorization: session.token }
    project_id = Project.find_by_name('Sample Project').id
    delete '/api/v1/projects',
           params: { id: project_id },
           headers: { Authorization: session.token }
    expect_status '200'
  end

  it 'should update project' do
    post '/api/v1/projects',
         params: { name: 'Sample Project' },
         headers: { Authorization: session.token }
    project = Project.find_by_name('Sample Project')
    put '/api/v1/projects',
           params: { id: project.id, name: 'New Name' },
           headers: { Authorization: session.token }
    expect_status '200'
    expect(project.reload.name).to eq 'New Name'
  end

  it 'should not delete project without permissions' do
    delete '/api/v1/projects',
           params: { id: project.id },
           headers: { Authorization: session.token }
    expect_status '403'
  end

  it 'should not create project without authorization' do
    post '/api/v1/projects',
         params: { name: 'Test Project' }
    expect_status '401'
  end
end
