Python also allows us to inherit from multiple classes.

<image>multiple_inheritance.png</image><codeblock language="python" type="lesson">
<code>
class Phone:
  """
  Contains all functionalities and data of a Phone
  """
  def call(self, number):
    print(f"Calling {number}")


class Camera:
  """
  Contains all functionalities and data of a Camera
  """

  def open_camera(self):
    print(f"Opening Back camera")

class IPhone(Phone, Camera):
  def __init__(self):
    print("Switching on iPhone")

iphone = IPhone()
iphone.call("123456789") # <-- Calls from Phone class
iphone.open_camera() # <-- Calls from Camera class
</code>
</codeblock>

If there conflicting methods between the two parent classes, Python chooses the method from the class mentioned first.

<codeblock language="python" type="lesson">
<code>
class Phone:
  """
  Contains all functionalities and data of a Phone
  """
  def start(self):
    print(f"Opening Caller")


class Camera:
  """
  Contains all functionalities and data of a Camera
  """

  def start(self):
    print(f"Opening Camera")

class IPhone(Phone, Camera):
  def __init__(self):
    print("Switching on iPhone")

iphone = IPhone()
iphone.start() # <-- Calls from Phone class
</code>
</codeblock>

Try changing the order of the Parent classes from `Phone, Camera` to `Camera, Phone` and see the results.

