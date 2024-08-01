Let's look at the following code.

<codeblock language="ruby" type="lesson">
<code>
class Adder
  def sum(a,b)
    return a+b
  end
end

adder = Adder.new
puts adder.sum(10,20)
</code>
</codeblock>

In the above case the method returns the sum of two variables.
In Ruby the output of the last line is auto returned. We don't have to use
`return` to return the values of the last line.

Let's see the above code without the `return` statement.

<codeblock language="ruby" type="lesson">
<code>
class Adder
  def sum(a,b)
    a+b
  end
end

adder = Adder.new
puts adder.sum(10,20)
</code>
</codeblock>

As you can see the result is same. That's because the last line of the method is auto returned.

Let's see one more example. We had seen following code earlier.

<codeblock language="ruby" type="lesson">
<code>
class CapitalCityFinder

  def get_capital_city(country)
    data = { France: "Paris", India: "New Delhi", England: "London" }
    city = data[country.to_sym]
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
</codeblock>

Let's not use `return` for the last line and then let's see what the result is.


<codeblock language="ruby" type="lesson">
<code>
class CapitalCityFinder

  def get_capital_city(country)
    data = { France: "Paris", India: "New Delhi", England: "London" }
    city = data[country.to_sym]
  end

  def info(country)
    city = get_capital_city(country)
    puts "The capital of #{country} is #{city}"
  end
end

finder = CapitalCityFinder.new
finder.info("India")
</code>
</codeblock>

The final output is the same.

Note that this "auto return" only works only for the very last statement of the method.
