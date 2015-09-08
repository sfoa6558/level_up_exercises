# RequestConfiguration options
class RequestConfiguration


  def initialize(host,path)
    self.host              = host
    self.port              = 80
    self.path              = path
    self.http_open_timeout = 2
    self.http_read_timeout = 2
  end

  attr_accessor :host

  # @return [Integer] HTTP port (defaults to +80+)
  attr_accessor :port

  # @return [String] relative service path (defaults to +webservice/+)
  attr_accessor :path


  # @return [Integer] HTTP connection timeout seconds (defaults to +2+)
  attr_accessor :http_open_timeout

  # @return [Integer] HTTP read timeout seconds (defaults to +2+)
  attr_accessor :http_read_timeout


end