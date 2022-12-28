Run the code and you will not get the correct answer.
Change the code so that it's correct. You are not allowed
to use "puts" in any of the methods.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class CapitalLooker
  def find_capital(country)
     hash = {"India" => "New Delhi", "France" => "Paris", "England" => "London"}
  end

  def info(country)
  end
end

looker = CapitalLooker.new
puts looker.info("India")
</code>

<solution>
class CapitalLooker
  def find_capital(country)
     hash = {"India" => "New Delhi", "France" => "Paris", "England" => "London"}
     return hash[country]
  end

  def info(country)
    city = find_capital(country)
    message = "The capital of #{country} is #{city}"
    return message
  end
end

looker = CapitalLooker.new
puts looker.info("India")
</solution>
</codeblock>