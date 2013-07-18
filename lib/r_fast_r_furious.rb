require "v8"
require "net/http"
require "uri"

module RFastRFurious
  SOURCE = "https://raw.github.com/alunny/r_fast_r_furious/master/fast.js"
  REGEX = /^((T(he)(?=.*the)|2(?=.* 2)) )?Fast (Five|(((and t\3)|\2(?=.*s$)|&(?!.*:)) Furious(( (6|7))|: Tokyo Drift)?))$/
  OFFLINE_ERRORS = [SocketError, Timeout::Error]

  def offline_check(string)
    !!REGEX.match(string)
  end
  module_function :offline_check

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
  rescue *OFFLINE_ERRORS
    offline_check(string)
  end
  module_function :check
end
