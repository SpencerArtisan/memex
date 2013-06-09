require 'todo'
require 'rest_app'

puts ToDo.new(RestApp.new()).execute ARGV
