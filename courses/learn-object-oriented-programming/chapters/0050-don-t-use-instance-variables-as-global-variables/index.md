```rb
class Machine
  attr_accessor :filename, :machine_data

  def initialize(filename, machine_data)
    @filename = filename
    @machine_data = machine_data
  end

  def open_file
    @file = File.open(@filename)
  end

  def parse_data_each_line
    @file.read.split("\n")
  end

  def remodeling_data
    @machine_data.each do |element|
    end
  end
end
```

In the above case even though `attr_accessor` is defined the user is not using
it effectively.

The programmer is using instance variables `@filename` and `@machine_data`
directly.

In an instance of a class the instance variables are available globally in the
object. Anywhere in the object any instance method can get hold of any instance
variable by just using `@name_of_variable`.

This behavior of instance variables makes instance variables like a global
constant. Any instance method can read it and any instance method can update it.

In the above class notice that method `open_file` is creating an instance
variable `@file`. And method `parse_data` is accessing that instance variable.

If we just look at those two methods then they are using @file as a global
constant. This is not a good way to write object oriented programs.

Object oriented programming is about accessing the data the right way. And the
right way in this case would be by using `attr_reader`, `attr_writer` or
`attr_accessor`.

Let's try to fix the above code. First let's see how `@file_name` and
`@machine_data` are being used. Both of these instance variables are being read.
No method is setting value to to it. So there is no need to have
`attr_accessor`. Let's change that to `attr_reader` and change the code so that
`@file_name` and `@machine_data` is not directly used.

```rb
class Machine
 attr_reader :filename, :machine_data

 def initialize(filename, machine_data)
   @filename = filename
   @machine_data = machine_data
 end

 def open_file
   @file = File.open(filename)
 end

 def parse_data_each_line
   @file.read.split("\n")
 end

 def remodeling_data
   machine_data.each do |element|
   end
 end
end
```

Now let's fix how `@file` is being used. The method `open_file` is writing to
this instance variable and method `parse_data` is reading this instance
variable. So we should use `attr_accessor` for this.

```rb
class Machine
 attr_reader :filename, :machine_data
 attr_accessor :file

 def initialize(filename, machine_data)
   @filename = filename
   @machine_data = machine_data
 end

 def open_file
   self.file = File.open(filename)
 end

 def parse_data_each_line
   file.read.split("\n")
 end

 def remodeling_data
   machine_data.each do |element|
   end
 end
end
```

Please note that in method `open_file` we need to use `self.file =`. If we use
only `file =` then Ruby will create a local variable called `file`.
