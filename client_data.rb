class ClientData

  attr_reader :tcp_server

  def initialize(tcp_server)
    @tcp_server = tcp_server
  end

  def accept
    tcp_server.accept
  end

end
