class ToDo
  def initialize rest_app
    @rest_app = rest_app
  end

  def execute args
    if args.empty?
      @rest_app.all
    elsif args[0] == '-d'
      @rest_app.delete args[1].to_i
    else
      @rest_app.add description: args.join(' ')
    end
  end
end
