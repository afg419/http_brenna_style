require 'minitest'
require 'minitest/autorun'
require 'pry'
require './parser'


class ParserTest < Minitest::Test

  def setup(verb = "POST", path = "/")
      input = ["#{verb} #{path} HTTP/1.1",
     "Host: 127.0.0.1:9292",
     "Connection: keep-alive",
     "Content-Length: 0",
     "Cache-Control: no-cache",
     "Origin: chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop",
     "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36",
     "Postman-Token: 8b0ac075-d686-0686-ac99-01894e5a4718",
     "Accept: */*",
     "Accept-Encoding: gzip, deflate",
     "Accept-Language: en-US,en;q=0.8"]
     pars = Parser.new(input)
  end

  def test_it_parses_verb
   assert_equal "POST", setup.set_verb
  end

  def test_it_parses_path
    assert_equal "/", setup.set_path
  end

end
