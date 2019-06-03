module V1
  module Entities
    class Sessions < Grape::Entity
      expose :token, documentation: { type: 'string', values: ['some_secret_token'] }
      expose :expiration,
             format_with: proc { |d| d.strftime('%Y-%m-%d %H:%M:%S.%L') },
             documentation: { type: 'datetime', values: ['2018-04-27 17:56:00.104'] }
    end
  end
end
