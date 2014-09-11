require 'redis'

# use a different database if only this app will need it. use 0 where everything will be shared.
REDIS = Redis.new(:host => ENV['REDIS_HOST'], :port => ENV['REDIS_PORT'], :password => ENV['REDIS_AUTH'], :db => 0)