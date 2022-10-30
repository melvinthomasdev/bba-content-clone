Python supports inheriting data and methods from other classes. This can help us to avoid rewriting common functionalities across multiple classes.

<Image>subclass.png</Image><Editor lang="python">
<code>
class Phone: # <-- Parent class
  """
  Contains all functionalities and data of a Phone
  """

  def call(self, number):
    print(f"Calling {number}")


class IPhone(Phone): # <-- Inherits Phone class
  """
  Contains all functionalities and data of a Phone and IPhone
  """
  def __init__(self):
    self.ios_version = "12.5.6"

  def get_ios_version(self):
    print(f"iOS Version {self.ios_version}")


class AndroidPhone(Phone): # <-- Inherits Phone class
  """
  Contains all functionalities and data of a Phone and Android Phone
  """
  def open_playstore(self):
    print("Opening Play Store")


print("Calling iPhone methods")
iphone = IPhone()
iphone.call("999999999") # <-- Called from parent (Phone) class
iphone.get_ios_version() # <-- Called from child (IPhone) class

print()

print("Calling Android methods")
android_phone = AndroidPhone()
android_phone.call("999999999") # <-- Called from parent (Phone) class
android_phone.open_playstore()  # <-- Called from child (AndroidPhone) class
</code>
</Editor>

In our example above, `Phone` is the parent class and `IPhone` and `AndroidPhone` are child classes that inherit from the Phone class. They are able to use the `.call() `method from the `Phone` class due to inheritance.

