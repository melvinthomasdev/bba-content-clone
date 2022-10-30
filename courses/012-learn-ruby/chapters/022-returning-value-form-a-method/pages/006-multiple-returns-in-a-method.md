A method can have many return statements. Let's start with the following code.

<Editor lang="ruby">
<code>
class CapitalCityFinder

  def get_city(country)
    data = { "France" => "Paris", "India" => "New Delhi", "England" => "London" }
    city = data[country]
    return city
  end

  def info(country)
    city = get_city(country)
    puts "The capital of #{country} is #{city}"
  end
end

finder = CapitalCityFinder.new
finder.info("India")
</code>
</Editor>

Let's say that we want to return nil if the country is not present.

<Editor lang="ruby">
<code>
class CapitalCityFinder

  def get_city(country)
    data = { "France" => "Paris", "India" => "New Delhi", "England" => "London" }

    return nil if country == nil
    city = data[country]
    return city
  end

  def info(country)
    city = get_city(country)
    if city == nil
      puts "Sorry we don't have info about the country #{country}"
    else
      puts "The capital of #{country} is #{city}"
    end
  end
end

finder = CapitalCityFinder.new
finder.info("Japan")
</code>
</Editor>

In the above case we are checking if the country is being passed or not.
We are returning nil if there is no country.