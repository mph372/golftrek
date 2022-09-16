require_relative "boot"

require "rails/all"
require 'csv'
require 'roo'
require 'dead_end'
require 'uri'
require 'net/http'
require 'openssl'
require "json"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Golftrek
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

Google::Maps.configure do |config|
  config.authentication_mode = Google::Maps::Configuration::API_KEY
  config.api_key = ENV["google_maps_api"]
end

GoogleSearch.api_key = ENV["google_search_api"]

client = OpenWeather::Client.new(
  api_key: ENV["openweather_api"]
)