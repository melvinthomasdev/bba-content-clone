Symbols are used a lot for method arguments.
Later we will see more usage of it.

<codeblock language="ruby" type="lesson">
<code>
class Person

  attr_reader :name
  attr_writer :height

  def initialize(name, height)
    @name = name
    @height = height
  end
end

mentor = Person.new(:name => 'Joe', :height => '5')
</code>
</codeblock>

Also, as we discussed earlier, symbols are frequently used as hash keys.

<codeblock language="ruby" type="lesson">
<code>
person1 = { "name" => "Sam", "age" => 47}
age_of_person = person1["age"]

puts age_of_person
</code>
</codeblock>

In the case provided above, we used the string **age** twice.
It means Ruby had to create two strings with the same value.
Creating more strings take more memories.

<codeblock language="ruby" type="lesson">
<code>
person2 = { :name => "Sam", :age => 47}
age_of_person = person2[:age]

puts age_of_person
</code>
</codeblock>

In the case given above, as you already know, symbols are used as keys instead of strings.
It means once the symbol `:age` was created then the same symbol
is used when the value is retrieved. For the whole operation
only once `:age` symbol was created and it helps save memory.
