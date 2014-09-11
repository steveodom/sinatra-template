require 'rubygems'
require 'pry'
require 'json'
require 'faraday'

# for Twitter.base_uri
require 'open-uri'
require 'open_uri_redirections'

# # require 'newrelic_rpm'

if ENV['RACK_ENV'] != "production"
	require 'dotenv'
	Dotenv.load
end

Dir['./config/initializers/*.rb'].each{ |f| require f }
Dir['./models/*.rb'].each{ |f| require f }
Dir['./lib/*.rb'].each{ |f| require f }
