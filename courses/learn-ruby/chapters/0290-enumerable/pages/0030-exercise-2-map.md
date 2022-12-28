You are given an array with the names of people.
The task is to print "Good Morning name-of-the-person" for each person.
Solve this problem using `map`.
Don't use `puts` inside the method `greet`.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
def greet(array)
end

puts greet(["John", "Mary", "Peter", "Bob"])
</code>

<solution>
def greet(array)
  array.map { |record| "Good Morning #{record}"}
end

puts greet(["John", "Mary", "Peter", "Bob"])
</solution>
</codeblock>