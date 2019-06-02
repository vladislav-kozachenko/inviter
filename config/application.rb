require_relative 'boot'

require 'rails/all'

require 'active_model/railtie'
require 'active_record/railtie'
require 'sprockets/railtie'
require 'action_mailer/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

GrapeDeviseTokenAuth.setup!

module Inviter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options, :delete, :put ]

      end
    end

  end
end
