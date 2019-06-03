module V1
  module Entities
    module Errors
      class CommonError < Grape::Entity
        expose :status, documentation: { type: Integer, desc: 'Error status code' }
        expose :message, documentation: { type: String, desc: 'Error message' }
      end
    end
  end
end
