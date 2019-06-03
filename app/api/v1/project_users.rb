module V1
  class ProjectUsers < Grape::API
    before { authenticate! }

    helpers V1::APIHelpers::AuthenticationHelper

    resources :user_projects do
      desc 'Get User Projects' do
        success V1::Entities::Projects
        headers AUTH_TOKEN
      end
      get do
        projects = current_user.project_users
        present projects, with: V1::Entities::Projects
      end

      desc 'Add User to Project' do
        success V1::Entities::Projects
        headers AUTH_TOKEN
      end
      params do
        requires :project_id, type: Integer, allow_blank: false, desc: 'Project ID'
        requires :user_id, type: Integer, allow_blank: false, desc: 'User ID'
        requires :user_role, type: Integer, allow_blank: false, desc: 'Role'
      end
      post do
        project = current_user.project_users.find_by(user_role: 0, project_id: params[:project_id])
        project_user = ProjectUser.create!(project_id: project.id, user_id: params[:user_id], user_role: params[:user_role])
        present project_user, with: V1::Entities::ProjectUsers
      end

      desc 'Change Role' do
        success V1::Entities::Projects
        headers AUTH_TOKEN
      end
      params do
        requires :id, type: Integer, allow_blank: false, desc: 'ID'
        requires :user_role, type: String, allow_blank: false, desc: 'Role'
      end
      put do
        project_user = ProjectUser.find_by(id: params[:id])
        if project_user.project.project_users.where(user: current_user, role: 0)
          project_user.update(declared(params))
          present project_user, with: V1::Entities::ProjectUsers
        else
          error!('Forbidden', 401)
        end
      end

      desc 'Remove User Access' do
        success V1::Entities::NoContent
        headers AUTH_TOKEN
      end
      params do
        requires :id, type: Integer, allow_blank: false, desc: 'ID'
      end
      delete do
        project_user = ProjectUser.find_by(id: params[:id])
        if project_user.project.project_users.where(user: current_user, role: 0)
          project_user.destroy!
          present status, with: V1::Entities::NoContent
        else
          error!('Forbidden', 401)
        end
      end
    end
  end
end
