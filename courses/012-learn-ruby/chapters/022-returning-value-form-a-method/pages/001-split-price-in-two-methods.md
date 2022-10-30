So far we have been using `puts` in our methods.

<Editor lang="ruby">
<code>
class Coffeemaker
  def price(condition)
    price = condition == "hot" ? "$4" : "$3"
    puts "The cost of the coffee is #{price}"
  end
end

coffee1 = Coffeemaker.new
coffee1.price("hot")
</code>
</Editor>

In the above case the method `price` doesn't return anything.
It prints the output. Let's change the code so that the `price` method
returns the message and some other method prints the output.

<Editor lang="ruby">
<code>
class Coffeemaker
  def price(condition)
    price = condition == "hot" ? "$4" : "$3"
  end

  def print(condition)
    cost = price(condition)
    puts "The cost of the coffee is #{cost}"
  end
end

coffee1 = Coffeemaker.new
coffee1.print("hot")
</code>
</Editor>

In the above case the method `price` is returning the cost of the coffee based on the `condition`.
In the method `print` the returned value is being stored in variable `cost`
and then we are printing that message. Note that the method `price` is not printing any value.
It's returning the price to the method that called it.

Let's see a few more examples of a method returning values.