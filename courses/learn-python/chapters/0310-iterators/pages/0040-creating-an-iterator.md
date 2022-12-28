To create an iterator we have to add the `__iter__` and `__next__` methods in our class. `__iter__` is used to initialize the iterator object and `__next__` is used to return the next value from the iterator.

To create an iterator instance we have to call the `iter()` function on the object of the class.

<codeblock language="python" type="lesson">
<code>
class IDGenerator:
  def __init__(self, prefix): # <-- Intialize object with prefix
    self.prefix = prefix

  def __iter__(self):
    self.start = 0 # <-- Intiailize iterator sequence
    return self

  def __next__(self):
    self.start += 1
    return f"{self.prefix}{self.start:03d}" # <-- return next value from seq



gen = IDGenerator("GA")
iterator = iter(gen) # <-- get iterator object

print(next(iterator)) # <-- get next value
print(next(iterator))
print(next(iterator))
</code>
</codeblock>