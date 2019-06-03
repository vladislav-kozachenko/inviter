module V1
  class Registrations < Grape::API
    resources :registration do
      desc 'User registration' do
        success V1::Entities::Registrations
      end
      params do
        requires :email, type: String, allow_blank: false, desc: 'Email'
        requires :password, type: String, allow_blank: false, desc: 'Password'
        requires :password_confirmation, type: String, allow_blank: false, desc: 'Password'
      end
      post do
        user = User.create!(email: params[:email], password: params[:password])
        Session.create!(user: user)
        present user, with: V1::Entities::Registrations
      end
    end
  end
end
