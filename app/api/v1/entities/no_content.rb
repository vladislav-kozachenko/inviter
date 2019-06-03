module V1
  module Entities
    class NoContent < Grape::Entity
      expose :success, documentation: { type: 'string', values: '{ success: true }' }

      private

      def success
        true
      end
    end
  end
end
