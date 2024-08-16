While the Batmobile is a Car, Batman can also use it to inflict damage on his enemies. Keeping this in mind, Jonas wants to add the weapons functionality within the Batmobile.

Help him do the same by inheriting the `Car` and `Weapon` class within `Batmobile`.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Inherit Car and Weapon in Batmobile

class Car:
  def open_door(self):
    print("Opening door.")

  def start_car(self):
    print("Starting Car.")

class Weapon:
  def inflict_damage(self):
    print("Health was reduced by 40")

class Batmobile:
  pass


batmobile = Batmobile()
batmobile.open_door()
batmobile.start_car()
batmobile.inflict_damage()
</code>

<solution>
# Inherit Car and Weapon in Batmobile

class Car:
  def open_door(self):
    print("Opening door.")

  def start_car(self):
    print("Starting Car.")

class Weapon:
  def inflict_damage(self):
    print("Health was reduced by 40")

class Batmobile(Car, Weapon):
  pass


batmobile = Batmobile()
batmobile.open_door()
batmobile.start_car()
batmobile.inflict_damage()
</solution>
</codeblock>