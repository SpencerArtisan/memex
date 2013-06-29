class ClientRestApp
  def all
    @memories = Memory.all
    template_file = File.open("app/views/memories/index.text.erb", 'r').read
    erb = ERB.new(template_file)
    erb.result binding
  end

  def add params
    @memory = Memory.create params
  end
  
  def amend id, params
    Memory.update id, params
  end

  def delete id
    Memory.destroy id
  end
end
