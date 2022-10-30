Ruby ignores everything that comes after a `#`.
Programmers call it a **comment**.

Comments are for humans and not for computers.
Computers skip all the comments and do not even look at them.

<Editor lang="ruby">
<code>
# This is a comment
greet = "Hello world"
# This line will not be executed
</code>
</Editor>

Ruby will ignore the first line,
because it is a comment.

A comment can start midway too:

<Editor lang="ruby">
<code>
greet = "Hello world" # this greeting is not personalized
</code>
</Editor>

In the example given above,
Ruby will process the
statement until it sees
a `#` and then it will
ignore the rest of the line.

Note that if a `#` appears
inside a string, then Ruby
will not ignore it.

<Editor lang="ruby">
<code>
hello = "Good evening #--- Mr. Bezos"
</code>
</Editor>

In the example given above, `#` is inside a string,
so Ruby will not treat it as a comment.