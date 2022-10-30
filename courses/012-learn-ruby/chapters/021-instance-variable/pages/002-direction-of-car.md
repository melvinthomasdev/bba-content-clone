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

Let's add a method so that we
can ask **car1**, in which direction
is it currently going.
The method name will be `current_direction`.

<Editor lang="ruby">
<code>
class Carmaker
  def turn(direction)
    puts "The car is turning"
  end

  def current_direction
    puts "The current direction is"
  end
end

car1 = Carmaker.new
car1.turn("left")
</code>
</Editor>

Here, we run into the same issue.
Method `current_direction` cannot access
variable **direction** of method **turn**.

We want **turn** method to
store the **direction**
in an instance variable so that
**current_direction** can
access that instance variable.

If we add `@` to a variable,
then that variable becomes
`instance variable`.
The special thing about an
instance variable is that any
instance method can access an
instance variable.

In this case, we are going
to store the direction of
the turn into an instance variable.

<Editor lang="ruby">
<code>
class Carmaker
  def turn(direction)
    @direction = direction
    puts "The car is turning"
  end

  def current_direction
    puts "The current direction is #{@direction}"
  end
end

car1 = Carmaker.new
car1.turn("left")
car1.current_direction
</code>
</Editor>