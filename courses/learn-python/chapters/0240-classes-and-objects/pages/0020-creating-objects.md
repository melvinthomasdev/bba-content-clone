If classes are the blueprint for an item, objects are the actual item. We have designed the blueprint of a Dog with attributes such as `name` and `breed`, and methods `bark` and `wag_tail`. The next thing we do is create an object for this class. i.e create a dog who has a name and breed type.

<image>objects.png</image><codeblock language="python" type="lesson">
<code>
class Dog:
  def __init__(self, name, breed):
    self.name = name
    self.breed = breed

  def bark(self):
    print("Woof")

  def wag_tail(self):
    print("Wagging tail..")

chester = Dog(name="Chester", breed="dalmatian") # create a dog object with name Chester and breed dalmatian
chester.bark()
chester.wag_tail()
print(f"The dog name is {chester.name}")
print(f"The dog name is {chester.breed}")
</code>
</codeblock>

We have now successfully created one instance of a Dog. We can create as many instances as we like and assign them to our variables or append them to a list.

