We can find out the class of an object using the `__class__.__name__` attribute of the object.

<codeblock language="python" type="lesson">
<code>
class Dog:
  def __init__(self, name):
    self.name = name


chester = Dog("Chester")
print(chester.__class__.__name__)
</code>
</codeblock>