Let's see the following case:

<Editor lang="ruby">
<code>
name = "John Smith"
greetings = "Good morning " + name
puts greetings
</code>
</Editor>

We can also write above code as shown below.

<Editor lang="ruby">
<code>
name = "John Smith"
greetings = "Good morning #{name}"
puts greetings
</code>
</Editor>

Notice that instead of
concatenating the two
strings with a `+` sign,
we are using `#{ }`.
If the string is a double
quoted string,
then Ruby will try to evaluate
the code inside the `{ }`.
This is called **String Interpolation**.

Let's see more examples
of string interpolation:

<Editor lang="ruby">
<code>
puts "Current time is #{Time.now}"

movie = "Gone with the wind"
puts "We are going to watch #{movie}"

city = "Tokyo"
country = "Japan"
puts "#{city} is the capital of #{country}"
</code>
</Editor>

Note that string interpolation
only works if the string
is using double quotes.

String interpolation does not work
with a single quoted string.
Let's test that:

<Editor lang="ruby">
<code>
name = "John Smith"
greetings = 'Good morning #{name}'
puts greetings
</code>
</Editor>