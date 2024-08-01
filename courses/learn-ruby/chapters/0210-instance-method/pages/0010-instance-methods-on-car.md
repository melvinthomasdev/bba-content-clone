Let's create a car instance
using the **Carmaker** class.

<codeblock language="ruby" type="lesson">
<code>
class Carmaker
end

car1 = Carmaker.new
</code>
</codeblock>

Now that we have a car instance,
what can we do with it?

In a real car, we can do things
like **play music**, **stop car**,
**turn lights on**.
In our class, we will have to add
these methods to do those things.
Let's add a few methods to our class.

Previously, we have used
`reverse`, `to_s` and `to_i`.
These are methods that
are **built into Ruby**, so
we do not have to create
those methods by ourselves.

In Ruby, this act of adding
a method in a class is
called **defining a method**.

So, let's define some methods.
A method starts with `def`
and
ends with `end`.

```
class Carmaker
  def play_music
  end

  def stop_car
  end

  def turn_lights_on
  end
end
```

These methods are empty
and
they don't do anything.
Let's add a message in these methods:

```
class Carmaker
  def play_music
    puts "playing music"
  end

  def stop_car
    puts "stopping the car"
  end

  def turn_lights_on
    puts "turning the lights on"
  end
end
```

To use these methods, we need
to create a car instance
and
on that car instance,
we need to call the methods.

<codeblock language="ruby" type="lesson">
<code>
class Carmaker
  def play_music
    puts "playing music"
  end

  def stop
    puts "stopping the car"
  end

  def turn_lights_on
    puts "turning the lights on"
  end
end

car1 = Carmaker.new
car1.play_music
car1.stop
car1.turn_lights_on
</code>
</codeblock>

Run code to see the result.