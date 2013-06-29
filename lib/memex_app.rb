require 'hypermedia'

class MemexApp
  include Hypermedia

  def all_memories
    Memory.all
  end

  def active_memories
    []
  end

  def add_memory

  end

  def sync
    all_memories.map &:sync
  end

  operation :sync  do
  end

  operation :all_memories do
    link '/memories'
  end

  operation :active_memories do
    link '/memories;active'
  end

  operation :add_memory do
    link '/memories/new'
  end
end
