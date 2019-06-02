class Base < Grape::API
  mount V1::API

  add_swagger_documentation(
    base_path: '/',
    mount_path: '/api/swagger_doc',
    api_version: 'v1',
    hide_documentation_path: true,
    hide_format: true,
    info: {
      title: 'API documentation'
    }
  )
end
