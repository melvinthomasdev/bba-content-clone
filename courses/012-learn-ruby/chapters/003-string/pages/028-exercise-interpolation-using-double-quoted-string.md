Using string interpolation,
greet Mary with the message
**Good evening, Mary**.

<Editor lang="ruby" type="exercise">
<code>
name = "Mary"
greet = "Good evening"
greetings =
puts greetings
</code>

<solution>
name = "Mary"
greet = "Good evening"
greetings = "#{greet}, #{name}"
puts greetings
</solution>
</Editor>