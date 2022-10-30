The Batmobile runs on an Electric charge rather than Gas which the other cars use. Keeping this in mind Jonas needs to overwrite the `refuel()` method of the `Car` class within the `Batmobile` class.  Help him do the same.

Create a `refuel()` method within the `Batmobile` class and print **Connecting  to Charging port** when it is called.


<Editor lang="python" type="exercise">
<code>
# Overwrite the refuel method in Batmobile class

class Car:
  def refuel(self):
    print("Filling Gas...")


class Batmobile(Car):
  # Overwrite refuel method here
  pass

batmobile = Batmobile()
batmobile.refuel()
</code>

<solution>
# Overwrite the refuel method in Batmobile class

class Car:
  def refuel(self):
    print("Filling Gas...")


class Batmobile(Car):
  def refuel(self):
    print("Connecting to Charging port")

batmobile = Batmobile()
batmobile.refuel()
</solution>
</Editor>