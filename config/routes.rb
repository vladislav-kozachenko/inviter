Rails.application.routes.draw do
  devise_for :users
  mount Base => '/'
  mount GrapeSwaggerRails::Engine => '/api/swagger'
end
