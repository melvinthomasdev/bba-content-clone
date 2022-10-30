In the last few lessons,
we wrote code like this:

```
coffee1 = Coffeemaker.new
coffee1.serve("hot")
```

This works, but what would be nicer, is
when we are creating the instance
we can give it some values.
For example, we should be able to say
to the **Cofeemaker** to make a **hot** coffee.
Right now, what we are doing
is we are asking **Coffeemaker** to make
a coffee and then we are asking
the instance to be **hot**.

We should be able to do this:

```
coffee1 = Coffeemaker.new("hot")
coffee1.serve
```

Ruby has a special method called `initialize`.
The method `initialize` is called when
a class creates an instance.

This `initialize` method is in all the
classes sitting at the top doing nothing.
In reality, our `CoffeeMaker` looks like this.

```
class CoffeeMaker
  def initialize
  end
end
```

When we are saying `Coffeemaker.new("hot")`,
we are passing the argument **hot** to the **initialize** method.
So far, we have not been using it.
But now let's use it:

<Editor lang="ruby">
<code>
class CoffeeMaker
  def initialize(condition)
    @condition = condition
  end

  def serve
    puts "This coffee is being served #{@condition}"
  end
end

coffee1 = CoffeeMaker.new("hot")
coffee1.serve
</code>
</Editor>