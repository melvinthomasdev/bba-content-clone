Let's say that you have
two friends **Mike** and **Adam**.
You want to make two biscuits
for them and you
want to gift them the biscuit.

<Editor lang="ruby">
<code>
class Biscuitproducer
  def gift
    puts "Mike this biscuit is a gift for you"
  end
end

biscuit1 = Biscuitproducer.new
biscuit2 = Biscuitproducer.new

biscuit1.gift
biscuit2.gift
</code>
</Editor>

Run the code and we will see that
both the biscuits output the same
message **Mike this biscuit is a gift for you**.
We want the second message to be for **Adam**.
The second message should
have been **Adam this biscuit is a gift for you**.

To solve this problem, we need the name
of the person to be a variable.
In Ruby, we can pass values to methods.

First, let's see how we solve
this problem then we will discuss it.

<Editor lang="ruby">
<code>
class Biscuitproducer
  def gift(name)
    puts "#{name} this biscuit is a gift for you"
  end
end

biscuit1 = Biscuitproducer.new
biscuit2 = Biscuitproducer.new

biscuit1.gift("Mike")
biscuit2.gift("Adam")
</code>
</Editor>

First, let's see how we are
calling the method `gift`:

```
# initially
biscuit1.gift

# now
biscuit1.gift("Mike")
```

Now, when we are calling
the method `gift`, then
we are also passing the name
of the person to whom the gift belongs.

Let's see what has
changed on the method side.

```
# initially
def gift
  ...
end

# now
def gift(name)
  ...
end
```

Here we have declared a variable called **name**.

When `biscuit1.gift("Mike")` is called then
**name** gets the value **Mike**.

Similarly, when `biscuit2.gift("Adam")`
is called then
**name** gets the value **Adam**.

_We know all this is confusing.
We will go over these concepts
again in the next lesson._