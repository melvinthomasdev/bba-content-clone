
Let’s look at a simple example, to understand how `super` keyword works:

<codeblock language="ruby" type="lesson">
<code>

class Car
  def fast
    "Cars are fast!"
  end
end

class ElectricCar < Car
  def fast
    super + " but an electric car can accelerate faster!"
  end
end

tesla = ElectricCar.new
puts tesla.fast

</code>
</codeblock>


So, using `super` we can call the same method as defined in the super-class. This helps us to re-use methods that exists in super-class, and modify them as per our needs in the subclass.


# Difference between Super and Super()

When we use `super`, Ruby invokes the method with same name from parent class,
along with the arguments that were passed to that method.

<codeblock language="ruby" type="lesson">
<code>

class Car
  def runs_on(name, fuel)
    "#{name} runs on #{fuel}."
  end
end

class PetrolCar < Car
  def runs_on(name, fuel)
    super
  end
end

ferrari = PetrolCar.new
puts ferrari.runs_on("Ferrari", "petrol")

</code>
</codeblock>

But, when we call with `super()`, it doesn’t pass any arguments to the parent. You can use `super()` when you just want to call the method inherited from Parent without passing any arguments.

And, you can use `super(arg1, arg2, …)` to pass only some specified arguments to the inherited method.

<codeblock language="ruby" type="lesson">
<code>

class Car
  def runs_on(fuel)
    "Your car runs on #{fuel}."
  end
end

class ElectricCar < Car
  def runs_on
    super("battery")
  end
end

tesla = ElectricCar.new
puts tesla.runs_on

</code>
</codeblock>
