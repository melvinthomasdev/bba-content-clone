Using `attr_accessor`, change the following code so
that we can change the
instance variables inside
the **doctor** instance of the Person class.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class Person
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

doctor = Person.new("Renu", "Sen", 23)
puts doctor.first_name
puts doctor.last_name
puts doctor.age
</code>

<solution>
class Person
  attr_accessor :first_name, :last_name, :age
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

doctor = Person.new("Renu", "Sen", 23)
puts doctor.first_name
puts doctor.last_name
puts doctor.age
</solution>
</codeblock>