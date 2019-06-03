module V1
  module Entities
    class ProjectUsers < Grape::Entity
      expose :id, documentation: { type: 'Integer', values: ['123'] }
      expose :user_role, documentation: { type: 'string', values: ['Project Name'] }
      expose :project, using: V1::Entities::Projects,
             documentation: { type: 'V1::Entities::Projects' }
    end
  end
end
