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

  it 'should allow editing of a memory' do
    memory = Memory.create description: 'memory'
    visit '/memories'
    click_on 'Edit'
    fill_in 'Description', with: 'modified'
    click_on 'Save'
    Memory.count.should == 1
    Memory.first.description.should == 'modified'
  end
end
