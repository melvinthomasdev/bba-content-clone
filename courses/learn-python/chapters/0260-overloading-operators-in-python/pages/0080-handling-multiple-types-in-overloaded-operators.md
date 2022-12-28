We can make an operator accept different types of arguments and execute different codes accordingly. In the example below, we can add either a `Bathroom` or a `Bedroom` to the House. The **+** operator figures out the type of room passed to it and adds it to its respective list.

<codeblock language="python" type="lesson">
<code>
class Bedroom: # <-- Bedroom class
  def __init__(self, room_owner):
    self.owner = room_owner

  def __repr__(self):
    return f"{self.owner}'s bedroom"


class Bathroom: # <-- Bathroom class
  def __init__(self, room_owner):
    self.owner = room_owner

  def __repr__(self):
    return f"{self.owner}'s bathroom"


class House:

  def __init__(self):
    self.bedrooms = []
    self.bathrooms = []

  def __add__(self, room): # <-- operator overloading done here
    if isinstance(room, Bathroom): # <-- if room is a Bathroom
      self.bathrooms.append(room)
    elif isinstance(room, Bedroom): # <-- if room is a Bedroom
      self.bedrooms.append(room)
    return house

  def __repr__(self):
    bedroom_names = [str(room) for room in self.bedrooms]
    bedroom_str = ', '.join(bedroom_names)

    bathroom_names = [str(room) for room in self.bathrooms]
    bathroom_str = ', '.join(bathroom_names)
    return f"House[bedrooms: [{bedroom_str}], bathrooms: [{bathroom_str}]]"



house = House()
judys_bedroom = Bedroom("Judy")
house = house + judys_bedroom
print(house)


arthurs_bathroom = Bathroom("Arthur")
house = house + arthurs_bathroom
print(house)
</code>
</codeblock>