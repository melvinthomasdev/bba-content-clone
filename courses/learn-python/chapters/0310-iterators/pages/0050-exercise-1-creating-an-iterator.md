Given below is a class that will calculate and generate the next leap year. Your task is to make it into an iterable by adding the `__iter__` and `__next__` methods. Print the next 3 yeap years once done.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
class LeapYear:
  def __init__(self, start_year):
    self.start_year = start_year
    
  # create __iter__ method
  
  # create __next__ method
  
leap_year = LeapYear(2020)

# Create iterator

print("The next 3 leap years are: ")
# Print next 3 leap years
</code>

<solution>
class LeapYear:
  def __init__(self, start_year):
    self.start_year = start_year
    
  def __iter__(self):
    return self
  
  def __next__(self):
    self.start_year += 4
    return self.start_year
  
leap_year = LeapYear(2020)

iterator = iter(leap_year)

print("The next 3 leap years are: ")
print(next(iterator))
print(next(iterator))
print(next(iterator))
</solution>
</codeblock>