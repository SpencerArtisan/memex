require 'todo'
require 'client_rest_app'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/development.sqlite3'
)

puts ToDo.new(ClientRestApp.new()).execute ARGV
