require 'data_mapper'
require 'dm-postgres-adapter'

require "./app/models/link.rb"
require "./app/models/tag.rb"
require "./app/models/user.rb"


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
#DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_test")
#DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_development")
DataMapper.finalize
