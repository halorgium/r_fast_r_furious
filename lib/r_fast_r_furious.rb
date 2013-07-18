module RFastRFurious
  REGEX = /^((T(he)(?=.*the)|2(?=.* 2)) )?Fast (Five|(((and t\3)|\2(?=.*s$)|&(?!.*:)) Furious(( (6|7))|: Tokyo Drift)?))$/
  def check(string)
    !!REGEX.match(string)
  end
  module_function :check
end
