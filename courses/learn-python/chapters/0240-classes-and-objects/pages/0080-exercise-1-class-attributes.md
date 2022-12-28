Annie wants to assign employee ID's to all the employee objects that are being created. She wants the ID's to automatically increment and be assigned to the instance when it is created.

Help Annie implement the functionality for Employee ID's using class attributes. Assign the ID's to an instance attribute called` id`, that can be accessed by calling `employee.id`. The employee ID should start from 1.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Add an id field to the Employee class.
# An incremented ID shlould be assigned when a new object is created.

class Employee:

  # Create class attribute count

  def __init__(self, name):
    self.name = name
    # Create id attribute and assign class attribute count

    # Increment class attribute count

  def checkin(self):
    print(f"{self.name} has entered the building.")

  def checkout(self):
    print(f"{self.name} has left the building.")

employee = Employee("Annie")
print(f"{employee.name}'s Employee ID: ", employee.id)
employee = Employee("Jonas")
print(f"{employee.name}'s Employee ID: ", employee.id)
employee = Employee("Peter")
print(f"{employee.name}'s Employee ID: ", employee.id)
</code>

<solution>
# Add a instance attribute "name" and assign it the value "Annie" in the constructor
# Edit the print statements as given above.

class Employee:
  CURRENT_MEMBERS = 0

  def __init__(self, name):
    self.name = name
    Employee.CURRENT_MEMBERS += 1
    self.id = Employee.CURRENT_MEMBERS

  def checkin(self):
    print(f"{self.name} has entered the building.")

  def checkout(self):
    print(f"{self.name} has left the building.")

employee = Employee("Annie")
print(f"{employee.name}'s Employee ID: ", employee.id)
employee = Employee("Jonas")
print(f"{employee.name}'s Employee ID: ", employee.id)
employee = Employee("Peter")
print(f"{employee.name}'s Employee ID: ", employee.id)
</solution>
</codeblock>