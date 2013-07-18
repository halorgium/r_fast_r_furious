require "v8"
require "net/http"
require "uri"

module RFastRFurious
  SOURCE = "https://raw.github.com/alunny/r_fast_r_furious/master/fast.js"
  def check(string, url = SOURCE)
    uri = URI.parse(SOURCE)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    content = response.body
    cxt = V8::Context.new
    cxt.eval(content, "fast.js")
    cxt["r_fast_r_furious"].call(string)
  end
  module_function :check
end
