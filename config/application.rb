require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Prototipo5
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #config.action_dispatch.default_headers = {
    #    'Access-Control-Allow-Origin' => 'http://localhost:3000',
#        'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    #    'Access-Control-Request-Method' => %w{GET POST PUT PATCH DELETE OPTIONS}.join(",")
    #  }

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        #origins 'localhost:3000', '127.0.0.1:3000'
        #resource '*', headers: :any, methods: [:get, :post, :options]
        #resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
        #resource '/api/*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
        resource(
          '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options]
          #methods: [:get, :post, :put, :patch, :delete, :options], credentials: true
        )
      end
    end
  end
end

require 'carrierwave'
require 'carrierwave/orm/activerecord'
