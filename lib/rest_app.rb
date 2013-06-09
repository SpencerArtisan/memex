require 'rest-client'

class RestApp
  def all
    RestClient.get 'http://localhost:3000/memories.text'
  end

  def add params
    do_ignore_redirect do
      RestClient.post 'http://localhost:3000/memories', {:memory => params}
    end
  end

  def delete id
    do_ignore_redirect do
      RestClient.delete "http://localhost:3000/memories/#{id}"
    end
  end

  def do_ignore_redirect
    begin
      yield
    rescue RestClient::Exception => e
      raise e unless e.message =~ /302/
    end
  end
end
