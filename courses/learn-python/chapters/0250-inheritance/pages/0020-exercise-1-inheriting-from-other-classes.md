Jonas is designing a Batman game. He is currently working on building the Batmobile car. He has already built the functionality for normal cars within the `Car` class and would like to reuse it within the `Batmobile` class.

Help Jonas complete the `Batmobile` class by inheriting the functionality of the `Car` class.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Inherit Car in Batmobile

class Car:
  def open_door(self):
    print("Opening door.")

  def start_car(self):
    print("Starting Car.")

class Batmobile:
  pass

batmobile = Batmobile()
batmobile.open_door()
batmobile.start_car()
</code>

<solution>
# Inherit Car in Batmobile and add shoot_missile method

class Car:
  def open_door(self):
    print("Opening door.")

  def start_car(self):
    print("Starting Car.")

class Batmobile(Car):
  pass

batmobile = Batmobile()
batmobile.open_door()
batmobile.start_car()
</solution>
</codeblock>