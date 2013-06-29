require 'settings'

module Hypermedia
  def self.included(base)
    base.extend ClassMethods
  end  

  def operations
    self.class.operations.keys
  end

  def absolute_link operation
    relative_url = self.class.operations[operation].call
    "#{Settings.url}/#{relative_url}" unless relative_url.nil?
  end

  module ClassMethods
    def operation(name, &block)
      operations[name] = block
    end  

    def operations
      @operations ||= {}
    end
  end  
end
