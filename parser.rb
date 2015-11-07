class Parser

  attr_accessor :request_array

  def initialize(request_array)
    @request_array = request_array

  end

  def set_verb
    request_array[0].split.first
  end

  def set_path
    request_array[0].split[1].split("?")[0]
  end

  def set_words
    request_array[0].split[1].split("?")[1].split("&").map do |x|
      x.gsub("word=","")
    end
  end

end


# ["POST / HTTP/1.1",
#  "Host: 127.0.0.1:9292",
#  "Connection: keep-alive",
#  "Content-Length: 0",
#  "Cache-Control: no-cache",
#  "Origin: chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop",
#  "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36",
#  "Postman-Token: 8b0ac075-d686-0686-ac99-01894e5a4718",
#  "Accept: */*",
#  "Accept-Encoding: gzip, deflate",
#  "Accept-Language: en-US,en;q=0.8"]
