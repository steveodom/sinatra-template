require 'rubygems'
Bundler.require

require './app'

run Rack::URLMap.new \
  "/"       => Sinatra::Application
