
So now we know the class which inherits the behaviors is called sub-class and the class it inherits from is called the super-class. **Inheritance** refers to this ability of an class to take on one or more characteristics from other classes.

To further understand, let's look at another example:

<image>inheritance_example_2.png</image>

<codeblock language="ruby" type="lesson">
<code>
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

class EnginePoweredVehicle < Vehicle
  def fuel_type(fuel)
    "Runs on #{fuel}"
  end

  def engine_manufacturer(manufacturer)
    "Engine manufacturer is #{manufacturer}"
  end

  def engine_size_in_cc(engine_size)
    "Engine size is #{engine_size}"
  end

  def number_of_cylinders(cylinders)
    "Has #{cylinders} cylinder engine"
  end

  def maximum_power_in_hp(power)
    "Outputs max power of #{power}hp"
  end

  def maximum_torque_in_nm(torque)
    "Max Torque of #{torque}Nm"
  end

  def is_turbocharged(turbocharged)
    turbocharged ? "Turbocharged Engine" : "Naturally Aspirated Engine"
  end
end

class Car < EnginePoweredVehicle
  def has_automatic_transmission
    true
  end

  def body_type
    "SUV"
  end
end

jeep = Car.new

puts jeep.fuel_type("Diesel")
puts jeep.engine_manufacturer("Fiat")
puts jeep.maximum_power_in_hp(150)
puts jeep.maximum_torque_in_nm(320)
puts jeep.is_turbocharged(true)
puts jeep.body_type("SUV")
puts jeep.number_of_wheels(4)
</code>
</codeblock>
