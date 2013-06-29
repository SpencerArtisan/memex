require 'remote_persistable'
require 'hypermedia'

class Memory < ActiveRecord::Base
  include RemotePersistable
  include Hypermedia

  operation :create do
    'memories'
  end
end
