When we run the following code,
we will get an error:

<Editor lang="ruby">
<code>
1 = "Hello world"
</code>
</Editor>

We are getting an error,
because `1` cannot be a variable.
In Ruby, a variable name must start
with a lowercase letter or with an underscore.

Here, if we use `a1`,
then that would work.
Since a variable can start
with an underscore, `_hello`
is also a valid variable name.

<Editor lang="ruby">
<code>
a1 = "Hello world"
puts a1

_hello = "Hello world"
puts _hello
</code>
</Editor>