require 'memex_app'

class Memory; end

describe MemexApp do
  let (:memex) { MemexApp.new }

  it 'should advertise an all_memories method' do
    memex.operations.should include :all_memories
  end

  it 'should advertise a sync to server method' do
    memex.operations.should include :sync
  end

  it 'should respond to all operations it advertises' do
    memex.operations.each {|operation| memex.should respond_to operation}
  end

  it 'should provide a list of all memories' do
    memory = stub
    Memory.stub :all => [memory]
    memex.all_memories.should == [memory]
  end
end
