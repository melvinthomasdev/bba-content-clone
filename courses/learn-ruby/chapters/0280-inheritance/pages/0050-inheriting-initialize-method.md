Let's look at a simple example, to understand how `initialize` method could be inherited from parent class:

<codeblock language="ruby" type="lesson">
<code>

class Car
  def initialize
    @driving = "You are driving a car"
  end
end

class PetrolCar < Car
  def drive
    @driving + ", which is petrol powered."
  end
end

class ElectricCar < Car
  def drive
    @driving + ", which is battery powered."
  end
end

ferrari = PetrolCar.new
puts ferrari.drive
tesla = ElectricCar.new
puts tesla.drive
</code>
</codeblock>

In the above code example, we could observe that the `@driving` was written only once in parent class and could be used in child classes. So that means the same `initialize` method is inherited by child classes from parent.
