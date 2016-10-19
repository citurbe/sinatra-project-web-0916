require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = '5SIRlyrUcMWFR8BzUNSIgg'
  config.consumer_secret = 'BA7kYx7eLNiZ8nvK9zll13p3ntQ'
  config.token = '3ETejs4g6b_teSYqw2bmhKlR6u6T8pmx'
  config.token_secret = '-7OxcGYadNfe5Ptu2NEXFqrRqf4'
end
