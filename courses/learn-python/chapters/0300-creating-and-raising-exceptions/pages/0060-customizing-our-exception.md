We can customize our `InvalidAgeException` class to accept certain arguments just like a normal class.

<codeblock language="python" type="lesson">
<code>
class InvalidAgeException(Exception):
  def __init__(self, age, error_message): # <-- customize arguments
    self.age = age
    self.message = error_message
    
  def __str__(self):
    return f"{self.age} is not in the range of 1 - 100"  # <-- customize display message
  
age = 999
  
if not 1 <= age <= 100:
  raise InvalidAgeException(age, "Invalid age value provided.")
</code>
</codeblock>

Our class will have `age` and `error_message` as mandatory fields. We have also modified the display message during the exception using `__str__`.

