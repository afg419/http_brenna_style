require_relative 'datay'
require_relative 'hello_world'
require_relative 'writer'
require_relative 'listener'
require_relative 'parser'
require_relative 'client_data'
require_relative 'debugger'
require_relative 'word_search'
require 'socket'
require 'pry'


class Server

  attr_reader :data, :client_data, :listener, :writer

  def initialize(tcp_server)
    @client_data = ClientData.new(tcp_server)
    @listener = Listener.new
    @writer = Writer.new
    @data = Datay.new
    @word_search = WordSearch.new(data)
    @hello = Hello_World.new(data)
  end

  def do_the_thing
    loop do

      client = client_data.accept
      input = listener.listen_and_vomit_http(client)
      pars = Parser.new(input)
      out = ""

      if pars.set_path == "/hello"
        out = @hello.print_hello_world
      end

      if pars.set_path == "/word_search"
        out = @word_search.search_dictionary(pars.set_words)
      end

      if pars.set_path == "/shutdown"
        data.big_guy_counter += 1
        out = "Total requests is: #{data.big_guy_counter}."
      end

      debugger = Debugger.new(pars)

      out += debugger.debug_it
      writer.write_vomit(client,out)
      client.close

      break if pars.set_path == "/shutdown"

    end
  end



# def do the thing
# loop
#
#   output = crazy shit happens add to counter, output stuff
#   if path == hello, use the hello class to do stuff
#   if not use some other class.
#   writer.write_vomit(client,output)
#   client_data.close
# end

end

server = Server.new(TCPServer.new(9292))
server.do_the_thing
