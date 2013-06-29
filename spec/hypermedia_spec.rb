require 'settings'
require 'hypermedia'

class TestHypermedia
  include Hypermedia

  operation :op do
    'endpoint'
  end
end

describe Hypermedia do
  let (:subject) { TestHypermedia.new }

  it 'should provide a list of operations' do
    subject.operations.should == [:op]
  end

  it 'should provide absolute links' do
    subject.absolute_link(:op).should == "#{Settings.url}/endpoint"
  end
end
