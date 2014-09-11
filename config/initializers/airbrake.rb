require 'airbrake'

Airbrake.configure do |config|
  config.api_key = ENV['AIRBRAKE_KEY']
  config.async = true
end