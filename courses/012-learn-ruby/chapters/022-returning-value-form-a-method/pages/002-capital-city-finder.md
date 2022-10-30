So far we have been using `puts` in our methods.

<Editor lang="ruby">
<code>
class CapitalCityFinder
  def info(country)
    data = { "France" => "Paris", "India" => "New Delhi", "England" => "London" }
    city = data[country]
    puts "The capital of #{country} is #{city}"
  end
end

finder = CapitalCityFinder.new
finder.info("India")
</code>
</Editor>

In the above case the method `info` doesn't return anything.
It prints the output. Let's change the code so that some other method
returns the city and method `info` builds the message and prints the message.

<Editor lang="ruby">
<code>
class CapitalCityFinder

  def get_capital_city(country)
    data = { "France" => "Paris", "India" => "New Delhi", "England" => "London" }
    city = data[country]
    return city
  end

  def info(country)
    city = get_capital_city(country)
    puts "The capital of #{country} is #{city}"
  end
end

finder = CapitalCityFinder.new
finder.info("India")
</code>
</Editor>

In the above case method `info` is calling method `get_capital_city`. Method `get_capital_city` is returning
the capital of the city. The method `info` is using the returned value.
