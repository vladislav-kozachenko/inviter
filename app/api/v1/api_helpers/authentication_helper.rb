module V1
  module APIHelpers
    module AuthenticationHelper
      TOKEN_PARAM_NAME = 'Authorization'.freeze

      def current_user
        @token = Session.find_by(token: token_from_request)
        return unless @token.present?
        @token.extend_expiration
        @current_user ||= @token.user
      end

      def authenticate!
        error!('Not Authorized', 401) unless current_user.present?
      end

      def logout
        token = current_user.sessions.find_by(token: token_from_request)
        token.destroy!
      end

      private

      def token_from_request(token_param = TOKEN_PARAM_NAME)
        request.headers[token_param]
      end
    end
  end
end
