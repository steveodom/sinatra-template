source "https://rubygems.org"
ruby '2.1.1'

gem 'sinatra'
gem 'rack' #for static site
gem 'rack-contrib'

gem 'pry'
# gem 'pry-debugger' #add step, next
gem 'airbrake'
gem 'sucker_punch'

gem 'mongoid',  "~> 3.1.2"
gem 'bson_ext'

gem 'redis'
# gem 'nokogiri'

# for loading the .env file locally
gem 'dotenv', :groups => [:development, :test]

# gem "geocoder"
gem 'faraday'
gem 'faraday_middleware'
gem 'simple_oauth'

# needed because open-uri won't allow to redirect from http to https and vice versa. needed to get base url
gem 'open_uri_redirections'

group :test do
  # gem 'spinach'
  gem "rack-test"
  gem "factory_girl"
  gem 'rspec'
end
