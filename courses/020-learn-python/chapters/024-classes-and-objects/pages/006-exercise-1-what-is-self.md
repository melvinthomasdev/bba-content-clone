Now that her basic class setup is complete, Annie also wants to store employee data in her class to make the program more user friendly. Help Annie **add an attribute *name* to the class**, which will contain the name of the employee. Assign the name using the `__init__` method. Also modify the print statemets to print the following:

* `checkin`: Print **X has entered the building.**
* `checkout`: Print **X has left the building.**

Where X is the Employees name.


<Editor lang="python" type="exercise">
<code>
# Add a instance attribute "name" and assign it the value "Annie" in the constructor
# Edit the print statements as given above.

class Employee:

  # define __init__ here



  def checkin(self):
    # update this statement
    print("The Employee has entered the building.")

  def checkout(self):
    # update this statement
    print("The Employee has left the building.")

employee = Employee("Annie")
employee.checkin()
employee.checkout()
</code>

<solution>
# Add a instance attribute "name" and assign it the value "Annie" in the constructor
# Edit the print statements as given above.

class Employee:

  def __init__(self, name):
    self.name = name

  def checkin(self):
    print(f"{self.name} has entered the building.")

  def checkout(self):
    print(f"{self.name} has left the building.")

employee = Employee("Annie")
employee.checkin()
employee.checkout()
</solution>
</Editor>