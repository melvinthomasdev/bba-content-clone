Let's say, that we have a method called `calculate_speed`.
We want this method to be present in classes
**Car**, **Rocket**, and **Ship**.

One way to do this is by adding the method
in each of these classes:

<codeblock language="ruby" type="lesson">
<code>
class Car
  def calculate_speed
    puts "current speed is now visible on your dashboard"
  end
end

class Rocket
  def calculate_speed
    puts "current speed is now visible on your dashboard"
  end
end

class Ship
  def calculate_speed
    puts "current speed is now visible on your dashboard"
  end
end
</code>
</codeblock>

But there is a problem with this approach.
When we want to change
`puts "current speed is now visible on your dashboard"`
to
`puts "current speed is now visible on your homepage"`
we'll need to go into all
the classes and change
each method individually.
This isn't ideal.

We want this method to be at only one place,
so that if we
make changes to it,
we get to use the updated method everywhere else.

We can do that by putting this method in a module.
Now, any class that needs to
calculate speed can **include**
the module and can do the speed calculation.

<codeblock language="ruby" type="lesson">
<code>
module Speed
  def calculate_speed
    puts "current speed is now visible on your dashboard"
  end
end

class Car
  include Speed
end

class Rocket
  include Speed
end

class Ship
  include Speed
end

car1 = Car.new
car1.calculate_speed

car2 = Car.new
car2.calculate_speed

rocket1 = Rocket.new
rocket1.calculate_speed
</code>
</codeblock>

Try changing the message in
**calculate_speed** and you'll
see that the result gets updated
in all the instances.