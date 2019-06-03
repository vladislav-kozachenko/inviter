module V1
  class Sessions < Grape::API
    helpers V1::APIHelpers::AuthenticationHelper

    resources :sessions do
      desc 'User login' do
        success V1::Entities::Sessions
      end
      params do
        requires :email,    type: String, allow_blank: false, desc: 'Email'
        requires :password, type: String, allow_blank: false, desc: 'Password'
      end

      post do
        user = User.find_by(email: params[:email].downcase)
        error!('Bad Authentication Parameters', 401) unless user.present? &&
                                                            user.valid_password?(params['password'])
        session = Session.create!(user: user)
        present session, with: V1::Entities::Sessions
      end

      desc "Destroy user's session." do
        headers AUTH_TOKEN
      end
      delete do
        authenticate!
        logout
        present status, with: V1::Entities::NoContent
      end
    end
  end
end
