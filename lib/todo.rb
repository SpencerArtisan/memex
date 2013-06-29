class ToDo
  def initialize rest_app
    @rest_app = rest_app
  end

  def execute args
    if args.empty?
      @rest_app.all
    elsif args[0] == '-d'
      @rest_app.delete args[1].to_i
    elsif args[0] == '-p'
      @rest_app.amend args[1].to_i, priority: :high
    elsif args[0] == '-c'
      @rest_app.amend args[1].to_i, status: :complete
    elsif args[0] == '-help'
      help
    else
      @rest_app.add description: args.join(' ')
    end
  end

  def help
    %q{
       todo                       list items
       todo an item description   add an item
       todo -d id                 delete item with given id}
  end
end
