module V1
  module Entities
    class Registrations < Grape::Entity
      expose :id, documentation: { type: 'integer', values: [11] }
      expose :email, documentation: { type: 'string', values: ['email@test.com'] }
      expose :sessions, using: V1::Entities::Sessions,
             documentation: { type: 'V1::Entities::Sessions' }
    end
  end
end
