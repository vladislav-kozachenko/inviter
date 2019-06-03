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
        requires :project_id, type: Integer, allow_blank: false, desc: 'Project ID'
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

    resources :accept_invitation do
      desc 'Accept Invitation' do
        success V1::Entities::Registrations
      end
      params do
        requires :invitation_token, type: String, allow_blank: false, desc: 'Invitation Token'
        requires :password, type: String, allow_blank: false, desc: 'Password'
        requires :password_confirmation, type: String, allow_blank: false, desc: 'Password Confirmation'
      end
      post do
        user = User.find_by(invitation_token: params[:invitation_token])
        user.accept_invitation!
        user.update(declared(params).except(:invitation_token))
        Session.create!(user: user)
        present user, with: V1::Entities::Registrations
      end
    end
  end
end
