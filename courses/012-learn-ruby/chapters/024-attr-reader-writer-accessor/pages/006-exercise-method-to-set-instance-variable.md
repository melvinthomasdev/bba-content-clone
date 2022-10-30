Change the following code so
that we can change the
instance variables inside
the **doctor** instance of the Person class.

<Editor lang="ruby" type="exercise">
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
  attr_reader :first_name, :last_name, :age
  attr_writer :first_name, :last_name, :age
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
</Editor>