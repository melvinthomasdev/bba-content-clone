Currently, the **+** operator is used to add two numbers or concatenate two strings together. Using **Operator Overloading** we can also modify it to perform some operations on our newly created objects.

To overload the **+** operator, we have to overwrite the internal `__add__` method of the operand's class. It is a method that is present by default in every class.

<codeblock language="python" type="lesson">
<code>
class House:
  def __init__(self):
    self.rooms = []

  def __add__(self, room): # <-- operator overloading done here
    self.rooms.append(room)
    return house

  def __repr__(self): # <-- For display purposes. Can be ignored
    room_names = [str(room) for room in self.rooms]
    room_str = ', '.join(room_names)
    return f"House[rooms: [{room_str}]]"


class Room:
  def __init__(self, room_owner):
    self.owner = room_owner

  def __repr__(self):
    return f"{self.owner}'s room"


house = House()
judys_room = Room("Judy")
house = house + judys_room # <-- add a room to house using overloaded + operator
print(house)

arthurs_room = Room("Arthur")
house = house + arthurs_room # <-- add another room to house
print(house)
</code>
</codeblock>

In the example above, we have the House class which overwrites the `__add__` method. It accepts a parameter room. This allows us to add rooms to the house using the + operator, as shown above.
