require "r_fast_r_furious/version"
require "v8"
require "net/http"
require "uri"

module RFastRFurious
  SOURCE = "https://raw.github.com/alunny/r_fast_r_furious/master/fast.js"
  def check(string, url = SOURCE)
    uri = URI.parse(SOURCE)
    content = Net::HTTP.get(uri)
    cxt = V8::Context.new
    cxt.eval(content, "fast.js")
    cxt["r_fast_r_furious"].call(string)
  end
  module_function :check
end
