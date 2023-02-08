We can call **Vehicle** class a super-class of **Bicycle** or **Bicycle** a sub-class of **Vehicle**. Similarly **Truck** and **Car** are sub-class of **EnginePoweredVehicle**. Let looks at a diagram and an example code, for more clarity.

<image>classes.png</image>

<codeblock language="ruby" type="lesson">
<code>

# The super-class
class Vehicle
  def number_of_wheels(wheels)
    "Has #{wheels} wheels"
  end

  def number_of_seats(seats)
    "Has #{seats} seats"
  end

  def owner_name(owner)
    "The owner is #{owner}"
  end
end

# The sub-class
class Bicycle < Vehicle
  def chain_manufacturer
    "Chain Manufactured by Shimano"
  end

  def additional_seating_at_carrier
    "Additonal seat available"
  end
end

# Instance
trekbike = Bicycle.new

puts trekbike.number_of_wheels(2)

puts trekbike.number_of_seats(2)

puts trekbike.owner_name("Renu Sen")

puts trekbike.chain_manufacturer

puts trekbike.additional_seating_at_carrier
</code>
</codeblock>

Lets move to next page to understand the defination of **Inheritance**...
