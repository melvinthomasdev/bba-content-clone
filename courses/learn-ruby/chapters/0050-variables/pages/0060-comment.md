Ruby ignores everything that comes after a `#`.
Programmers call it a **comment**.

Comments are for humans and not for computers.
Computers skip all the comments and do not even look at them.

<codeblock language="ruby" type="lesson">
<code>
# This is a comment
greet = "Hello world"
puts greet
# This line will not be executed
</code>
</codeblock>

Ruby will ignore the first line,
because it is a comment.

A comment can start midway too:

<codeblock language="ruby" type="lesson">
<code>
greet = "Hello world" # this greeting is not personalized
puts greet
</code>
</codeblock>

In the example given above,
Ruby will process the
statement until it sees
a `#` and then it will
ignore the rest of the line.

Note that if a `#` appears
inside a string, then Ruby
will not ignore it.

<codeblock language="ruby" type="lesson">
<code>
hello = "Good evening #--- Mr. Bezos"

puts hello
</code>
</codeblock>

In the example given above, `#` is inside a string,
so Ruby will not treat it as a comment.
