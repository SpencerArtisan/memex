require 'client_rest_app'

describe ClientRestApp do
  let (:app) { ClientRestApp.new }

  it 'should allow adding of a memory' do
    app.add :description => 'memory'
    Memory.count.should == 1
    Memory.first.description.should == 'memory'
  end

  it 'should allow deleting of a memory' do
    memory = Memory.create description: 'memory'
    app.delete 1
    Memory.count.should == 0
  end

  it 'should allow editing of a memory description' do
    memory = Memory.create description: 'memory'
    app.amend 1, :description => 'modified'
    Memory.count.should == 1
    Memory.first.description.should == 'modified'
  end
  
  it 'should provide a filtered text list of memories' do
    memory = Memory.create description: 'memory 1', status: nil
    memory = Memory.create description: 'memory 2', status: :complete
    page = app.all
    page.should include 'memory 1'
    page.should_not include 'memory 2'
  end

  it 'should provide a text list of memories' do
    memory = Memory.create description: 'memory'
    page = app.all
    page.should include '1. memory'
  end

  it 'should highlight high priority tasks in the list of memories' do
    memory = Memory.create description: 'memory', priority: :high
    page = app.all
    page.should include '*1. memory'
  end
end
