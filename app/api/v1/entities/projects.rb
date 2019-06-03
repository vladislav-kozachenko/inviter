module V1
  module Entities
    class Projects < Grape::Entity
      expose :id, documentation: { type: 'Integer', values: ['123'] }
      expose :name, documentation: { type: 'string', values: ['Project Name'] }
    end
  end
end
