require 'remote_persistable'

class TestPersistable
  include RemotePersistable

  def attributes
    {field: :value}
  end

  def absolute_link operation
    'endpoint' if operation == :create
  end
end

describe RemotePersistable do
  let (:subject) { TestPersistable.new }

  it 'should save a new instance of itself by posting to a RESTful api' do
    RestClient.should_receive(:post).with 'endpoint', data: {field: :value}
    subject.save_remote
  end
end
