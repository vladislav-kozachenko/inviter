module V1
  AUTH_TOKEN = { 'Authorization' => { description: 'Access Token', required: true } }.freeze
  class API < Grape::API
    include V1::Exceptions::Handler

    prefix 'api'
    version 'v1', using: :path
    format :json

    mount V1::Registrations
    mount V1::Sessions
    mount V1::Projects
    mount V1::ProjectUsers
  end
end
