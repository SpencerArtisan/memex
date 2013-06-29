module RemotePersistable
  def save_remote
    execute_ignore_redirect do
      RestClient.post absolute_link(:create), data: attributes
    end
  end
  
  def execute_ignore_redirect
    begin
      yield
    rescue RestClient::Exception => e
      raise e unless e.message =~ /302/
    end
  end
end
