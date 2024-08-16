Unlike normal cars, the Batmobile can spin around in a  circle. Jonas wants to add this functionality to his Batmobile class. The Car class has a method `do_action()` which takes in a `key` argument and does the following actions:

* W: Switches on Lights
* H: Blows Horn

Jonas has overwritten the `do_action()` method to support the following actions.

* E: Spins around

Help him maintain support for spinning the Batmobile around while also maintaining the present functionality from the parent `Car` class.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# use super() to add additional functionality to the do_action method

class Car:
  def do_action(self, key):
    if key == "W":
      print("Switching on Lights")
    elif key == "H":
      print("Blowing horn")


class Batmobile(Car):
  def do_action(self, key):
    # make changes here
    if key == "E":
      print("Spinning Batmobile")

batmobile = Batmobile()
batmobile.do_action("W")
batmobile.do_action("E")
</code>

<solution>
# use super() to add additional functionality to the do_action method

class Car:
  def do_action(self, key):
    if key == "W":
      print("Switching on Lights")
    elif key == "H":
      print("Blowing horn")


class Batmobile(Car):
  def do_action(self, key):
    super().do_action(key)
    if key == "E":
      print("Spinning Batmobile")

batmobile = Batmobile()
batmobile.do_action("W")
batmobile.do_action("E")
</solution>
</codeblock>