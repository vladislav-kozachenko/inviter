module V1
  class Projects < Grape::API
    before { authenticate! }

    helpers V1::APIHelpers::AuthenticationHelper

    resources :projects do
      desc 'Get Projects' do
        success V1::Entities::Projects
        headers AUTH_TOKEN
      end
      get do
        projects = current_user.projects
        present projects, with: V1::Entities::Projects
      end

      desc 'Create Project' do
        success V1::Entities::Projects
        headers AUTH_TOKEN
      end
      params do
        requires :name, type: String, allow_blank: false, desc: 'Name'
      end
      post do
        project = Project.create!(name: params[:name])
        ProjectUser.create!(project: project, user: current_user, user_role: 0)
        present project, with: V1::Entities::Projects
      end

      desc 'Update Project' do
        success V1::Entities::Projects
        headers AUTH_TOKEN
      end
      params do
        requires :name, type: String, allow_blank: false, desc: 'Name'
        requires :id, type: Integer, allow_blank: false, desc: 'ID'
      end
      put do
        project = current_user.projects.find_by(id: params[:id])
        project.update(declared(params))
        present project, with: V1::Entities::Projects
      end

      desc 'Delete Project' do
        success V1::Entities::NoContent
        headers AUTH_TOKEN
      end
      params do
        requires :id, type: Integer, allow_blank: false, desc: 'ID'
      end
      delete do
        project = current_user.projects.find_by(id: params[:id])
        project.destroy!
        present status, with: V1::Entities::NoContent
      end
    end
  end
end
