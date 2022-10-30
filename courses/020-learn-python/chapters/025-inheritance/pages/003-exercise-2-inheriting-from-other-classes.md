Now that Jonas has inherited the functionality of the `Car` class into the `Batmobile` class, he would like to add some extra functionality to the `Batmobile`.

The Batmobile will have the ability to shoot missiles. To support this, help Jonas add a new method in Batmobile called `shoot_missile()` which prints **Sssswossshhhhhh . . . Boom!** to the screen.


<Editor lang="python" type="exercise">
<code>
# Add shoot_missile method in the Batmobile class

class Car:
  def open_door(self):
    print("Opening door.")

  def start_car(self):
    print("Starting Car.")


class Batmobile(Car):
  # Add shoot_missile() method here

  pass

batmobile = Batmobile()
batmobile.start_car()
batmobile.shoot_missile()
</code>

<solution>
# Add shoot_missile method in the Batmobile class

class Car:
  def open_door(self):
    print("Opening door.")

  def start_car(self):
    print("Starting Car.")

class Batmobile(Car):
  def shoot_missile(self):
    print("Sssswossshhhhhh . . . Boom!")

batmobile = Batmobile()
batmobile.start_car()
batmobile.shoot_missile()
</solution>
</Editor>