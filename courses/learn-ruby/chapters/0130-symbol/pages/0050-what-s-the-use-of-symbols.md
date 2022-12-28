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

Symbols are used a lot as hash keys.

<codeblock language="ruby" type="lesson">
<code>
person1 = { "name" => "Sam", "age" => 47}
age_of_peson = person1["age"]
</code>
</codeblock>

In the case provided above, we used the string **age** twice.
It means Ruby had to create two strings with the same value.
Creating more strings take more memories.

<codeblock language="ruby" type="lesson">
<code>
person2 = { :name => "Sam", :age => 47}
age_of_peson = person2[:age]
</code>
</codeblock>

In the case given above, instead of string symbols are used as keys.
It means once the symbol `:age` was created then the same symbol
is used when the value is retrieved. For the whole operation
only once `:age` symbol was created and it helps save memory.
