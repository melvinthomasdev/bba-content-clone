 **Inheritance** is an important concept to understand in Ruby, but it is little complex. So we will look at some examples first.

Let's think about different types of vehicles we see day to day, like **Bicycle**, **Car** and **Truck**.

**Bicycle:**

```
class Bicycle
  def number_of_wheels
  end
  def number_of_seats
  end
  def owner_name
  end
  def year_of_manufacture
  end
  def chain_manufacturer
  end
  def additional_seating_at_carrier
  end
end
```

A **Bicycle** could have specifications such as number **wheels**, **seats**,
what type of **chain**, a **carrier** and **owner's** name etc.

**Car:**

```
class Car
  def number_of_wheels
  end
  def number_of_seats
  end
  def owner_name
  end
  def year_of_manufacture
  end
  def fuel_type
  end
  def chassis_number
  end
  def engine_manufacturer
  end
  def engine_size_in_cc
  end
  def number_of_cylinders
  end
  def maximum_power_in_hp
  end
  def maximum_torque_in_nm
  end
  def is_turbocharged
  end
  def has_automatic_transmission
  end
  def body_type
  end
end
```

A **Car** being more complex has many more specifications such as **fuel** type, **engine** details,
is it a **automatic** or a **manual** transmission, is it a **hatchback** or a **SUV** etc.

**Truck:**

```
class Truck
  def number_of_wheels
  end
  def number_of_seats
  end
  def owner_name
  end
  def year_of_manufacture
  end
  def fuel_type
  end
  def chassis_number
  end
  def engine_manufacturer
  end
  def engine_size_in_cc
  end
  def number_of_cylinders
  end
  def maximum_power_in_hp
  end
  def maximum_torque_in_nm
  end
  def is_turbocharged
  end
  def cargo_carrying_capacity
  end
  def number_of_axles
  end
end
```

A **Truck** may have some unique specifications, like how much **cargo_carrying_capacity** it has, is it a **multiaxle** vehicle or not etc.


We could observe that we are repeating ourselves again & again,
except few unqiue specifications. This is something we would always want to avoid while coding. Some specs are common across all the vehicles, like **number_of_wheels**, **number_of_seats**, **owner_name** and **year_of_manufacture**.

So let's create a class **Vehicle** with all the common characteristics.

```
class Vehicle
  def number_of_wheels
  end
  def number_of_seats
  end
  def owner_name
  end
  def year_of_manufacture
  end
end
```

Similarly, **Car** and **Truck** also has common features like **fuel_type**, **chassis_number** and some **engine** related details. So let's create another class **EnginePoweredVehicle** for that.

```
class EnginePoweredVehicle < Vehicle
  def fuel_type
  end
  def chassis_number
  end
  def engine_manufacturer
  end
  def engine_size_in_cc
  end
  def number_of_cylinders
  end
  def maximum_power_in_hp
  end
  def maximum_torque_in_nm
  end
  def is_turbocharged
  end
end
```

Now in Ruby we can re-write our **Bicycle** class again as below:

```
class Bicycle < Vehicle
  def chain_manufacturer
  end
  def additional_seating_at_carrier
  end
end
```

As **Bicycle** inherits all the common methods(features) of a **Vehicle**, plus 2 more like `chain_manufacturer` and `additional_seating_at_carrier`. This is equivalent to writing:

```
class Bicycle
  def number_of_wheels
  end
  def number_of_seats
  end
  def owner_name
  end
  def year_of_manufacture
  end
  def chain_manufacturer
  end
  def additional_seating_at_carrier
  end
end
```

Similarly, **Car** class inherits all the (features) of a **Vehicle** as well as **EnginePoweredVehicle**. So we can re-write our **Car** class as below:

```
class Car < EnginePoweredVehicle
  def has_automatic_transmission
  end
  def body_type
  end
end
```

And, our **Truck** class could re-written as below:

```
class Truck < EnginePoweredVehicle
  def cargo_carrying_capacity
  end
  def number_of_axles
  end
end
```

<image>inheritance.png</image>

Hold on to this and let's move to next page to understand further...
