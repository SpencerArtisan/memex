require 'rest-client'

class RestApp
  def all
    RestClient.get 'http://localhost:3000/memories.text'
  end

  def add params
    begin
      RestClient.post 'http://localhost:3000/memories', {:memory => params}
    rescue RestClient::Exception => e
      raise e unless e.message =~ /302/
    end
  end
end
