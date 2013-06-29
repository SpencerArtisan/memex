require 'spec_helper'

describe "Memories" do
  it 'should allow adding of a memory' do
    visit '/memories'
    click_on 'New Memory'
    fill_in 'Description', with: 'memory'
    click_on 'Save'
    Memory.count.should == 1
    Memory.first.description.should == 'memory'
  end

  it 'should allow deleting of a memory' do
    memory = Memory.create description: 'memory'
    visit '/memories'
    click_on 'Destroy'
    Memory.count.should == 0
  end

  it 'should allow editing of a memory description' do
    memory = Memory.create description: 'memory'
    visit '/memories'
    click_on 'Edit'
    fill_in 'Description', with: 'modified'
    click_on 'Save'
    Memory.count.should == 1
    Memory.first.description.should == 'modified'
  end
  
  it 'should allow editing of a memory priority' do
    memory = Memory.create description: 'memory'
    visit '/memories'
    click_on 'Edit'
    fill_in 'Priority', with: 'modified'
    click_on 'Save'
    Memory.count.should == 1
    Memory.first.priority.should == 'modified'
  end

  it 'should provide a text list of memories' do
    memory = Memory.create description: 'memory'
    visit '/memories.text'
    page.should have_content '1.  memory'
  end

  it 'should highlight high priority tasks in the list of memories' do
    memory = Memory.create description: 'memory', priority: :high
    visit '/memories.text'
    page.should have_content '*1.  memory'
  end

end
