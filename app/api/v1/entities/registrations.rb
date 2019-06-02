module V1
  module Entities
    class Registrations < Grape::Entity
      expose :id, documentation: { type: 'integer', values: [11] }
      expose :email, documentation: { type: 'string', values: ['email@test.com'] }
    end
  end
end
