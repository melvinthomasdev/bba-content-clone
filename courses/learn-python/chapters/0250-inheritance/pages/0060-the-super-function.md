There are times when we might wish to call the overwritten method from the parent class before executing the method from the child class. We can do this using the `super()` method. `super()` refers to a temporary instance of the parent class.

<codeblock language="python" type="lesson">
<code>
class Phone:
  """
  Parent Class
  """
  def power_up(self):
    print("Powering up Phone.")


class IPhone(Phone):
  """
  Child Class
  """
  def power_up(self):
    super().power_up() # <-- Calls Phone.power_up()
    print("Showing apple logo")


print("Calling iPhone methods")
iphone = IPhone()
iphone.power_up()
</code>
</codeblock>

In the example above, we overwrite the `power_up()` method. The new `power_up()` calls the parent `power_up()` using `super()` before printing **Showing apple logo**.

