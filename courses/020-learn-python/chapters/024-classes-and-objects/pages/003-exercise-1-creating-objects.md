Annie works at Google Inc. Her boss Sundar Pichai, has asked her to design a program for employee check in, and checkout. The program should track when an employee enters or leaves the building.

Annie being a huge fan of Object-Oriented Programming has decided to represent every employee within a class. Help Annie, design a class called `Employee`. Add the following methods to it with the respective functionality.

* `checkin`: Print **The Employee has entered the building.**
* `checkout`: Print **The Employee has left the building.**

Create an object of the `Employee` class and call the two methods, `checkin` and `checkout`.

<Editor lang="python" type="exercise">
<code>
# Create Employee class and add the checkin and checkout method


# Create Employee class

  # Create checkin method

  # Create checkout method


employee = Employee()
employee.checkin()
employee.checkout()
</code>

<solution>
# Create Employee class and add the checkin and checkout method
# Call the two methods

class Employee:
  def checkin(self):
    print("The Employee has entered the building.")

  def checkout(self):
    print("The Employee has left the building.")

employee = Employee()
employee.checkin()
employee.checkout()
</solution>
</Editor>