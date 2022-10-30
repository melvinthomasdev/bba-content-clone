In the previous lesson we saw the code given below.

<Editor lang="ruby">
<code>
class CapitalCityFinder

  def get_city(country_name)
    data = { "France" => "Paris", "India" => "New Delhi", "England" => "London" }
    city = data[country_name]
    return city
  end

  def info(country_name)
    city = get_city(country_name)
    puts "The capital of #{country_name} is #{city}"
  end
end

finder = CapitalCityFinder.new
finder.info("India")
</code>
</Editor>

In this case method `info` is using `puts` to print the message.

Now let's change the code such that method `info` returns the message and we print
the message after calling the method `info`.

<Editor lang="ruby">
<code>
class CapitalCityFinder

  def get_city(country_name)
    data = { "France" => "Paris", "India" => "New Delhi", "England" => "London" }
    city = data[country_name]
    return city
  end

  def info(country_name)
    city = get_city(country_name)
    return "The capital of #{country_name} is #{city}"
  end
end

finder = CapitalCityFinder.new
msg = finder.info("India")
puts msg
</code>
</Editor>


In the above case both the methods `get_city` and `info` are returning values and the printing
is being done at the very end.
