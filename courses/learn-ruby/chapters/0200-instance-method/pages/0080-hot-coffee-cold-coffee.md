Let's add method **serve**
to class **Coffeemaker**.

<codeblock language="ruby" type="lesson">
<code>
class Coffeemaker
  def serve
    puts "This coffee is being served"
  end
end

coffee1 = Coffeemaker.new
coffee1.serve
</code>
</codeblock>

When we run the code, then we
get the message
**This coffee is being served**.

Some people want **hot** coffee
and
some people want **cold** coffee.

```
coffee1.serve("hot")
coffee1.serve("cold")
```

Now, we are passing **condition** to the
**serve** method, so we need to make
changes to the **serve**
method to accept the type of coffee.

<codeblock language="ruby" type="lesson">
<code>
class Coffeemaker
  def serve(condition)
    puts "This coffee is being served #{condition}"
  end
end

coffee1 = Coffeemaker.new
coffee1.serve("hot")

coffee2 = Coffeemaker.new
coffee2.serve("cold")
</code>
</codeblock>

In this case, the method
`serve` takes one argument.
A method can also take more than
one argument as we will
see in the next lesson.