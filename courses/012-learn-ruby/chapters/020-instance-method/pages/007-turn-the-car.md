Let's add method **turn**
to class **Carmaker**.

<Editor lang="ruby">
<code>
class Carmaker
  def turn
    puts "The car is turning"
  end
end

car1 = Carmaker.new
car1.turn
</code>
</Editor>

Run the code and we get
the message **The car is turning**.
We want the car to turn
left sometimes and sometimes to
turn right.

When we call the **turn** method,
we should pass which side to turn.

```
car1.turn("left")
car1.turn("right")
car1.turn("left")
```

The method `turn` should
accept the direction of turn.

Let's change our code.

<Editor lang="ruby">
<code>
class Carmaker
  def turn(direction)
    puts "The car is turning #{direction}"
  end
end

car1 = Carmaker.new
car1.turn("left")
car1.turn("right")
</code>
</Editor>

This concept of passing different
values to the same method is called
**passing argument**.

In this case, we can say that
method **turn** takes one argument.
In the previous lesson, we saw that
the method **gift** also takes one argument.