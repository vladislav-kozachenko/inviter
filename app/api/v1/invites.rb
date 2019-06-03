module V1
  class Invites < Grape::API
    helpers V1::APIHelpers::AuthenticationHelper

    resources :invite do
      desc 'Invite User' do
        success V1::Entities::ProjectUsers
        headers AUTH_TOKEN
      end
      params do
        requires :email, type: String, allow_blank: false, desc: 'Email'
        requires :project_id, type: Integer, allow_blank: false, desc: 'Password'
        requires :user_role, type: Integer, allow_blank: false, desc: 'Role'
      end
      post do
        if Project.find(params[:project_id]).project_users.where(user: current_user, user_role: 0)
          user = User.invite!(email: params[:email].downcase, skip_invitation: true)
          project_user = ProjectUser.create(user: user, user_role: params[:user_role], project_id: params[:project_id])
          UserMailer.invite(user).deliver_now
          present project_user, with: V1::Entities::ProjectUsers
        else
          error!('Forbidden', 401)
        end
      end
    end
  end
end
