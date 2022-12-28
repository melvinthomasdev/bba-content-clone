First, let's get a hot coffee:

<codeblock language="ruby" type="lesson">
<code>
class Coffeemaker
  def serve(condition)
    puts "This coffee is being served #{condition}"
  end
end

coffee1 = Coffeemaker.new
coffee1.serve("hot")
</code>
</codeblock>

In the case provided above,
**coffee1** is served **hot**.
Let's add a method so that we
could ask **coffee** if it is hot.
The method name will be `is_it_hot?`.
Let's add this method.

<codeblock language="ruby" type="lesson">
<code>
class Coffeemaker
  def serve(condition)
    puts "This coffee is being served #{condition}"
  end

  def is_it_hot?
  end
end

coffee1 = Coffeemaker.new
coffee1.serve("hot")
</code>
</codeblock>

We have defined the `is_it_hot?` method.
However, there is a problem.
Whether the coffee is
hot or not, this information
is in the method `serve`.

In the method `serve`, it is the
`condition` variable that
holds the information if
the coffee is hot or not.

The method `is_it_hot?`
can't access `condition` variable because
variable `condition` is in the
method `serve` and only method
`serve` has access to that variable.

In order to make the variable
`condition` available to other methods,
we need to turn that
method into an instance variable.

In the next lesson, let's
see one more example of it.