Using string interpolation,
greet Mary with the message
**Good evening, Mary**.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
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
</codeblock>