require 'todo'

describe ToDo do
  let (:rest_app) {stub}
  let (:todo) { ToDo.new rest_app }

  it 'should retrieve a list of item' do
    rest_app.stub all: 'task'
    todo.execute([]).should == 'task'
  end

  it 'should add a new item' do
    rest_app.should_receive(:add).with description: 'task'
    todo.execute %w{task}
  end
  
  it 'should add a new multi-word item' do
    rest_app.should_receive(:add).with description: 'multi word task'
    todo.execute %w{multi word task}
  end

  it 'should delete an item' do
    rest_app.should_receive(:delete).with 1
    todo.execute %w{-d 1}
  end

  it 'should mark a task as high priority' do
    rest_app.should_receive(:amend).with 1, :priority => :high
    todo.execute %w{-p 1}
  end

  it 'should mark a task as complete' do
    rest_app.should_receive(:amend).with 1, :status => :complete
    todo.execute %w{-c 1}
  end

  it 'should provide help' do
    todo.execute(%w{-help}).should_not be_nil
  end
end
