The `proc` keyword defines a block.
This way, we can store the
block in a variable.
Later, we can call that block
using the `call` method.

<Editor lang="ruby">
<code>
intro = proc { puts "I am Roger Smith" }
intro.call
</code>
</Editor>

**Procs** can also take arguments.

<Editor lang="ruby">
<code>
intro = proc { |name|  puts "I am #{name}" }
intro.call("Mary")
</code>
</Editor>

Ruby also has something called `lambda`
which is very similar to a `proc`.
`lambda` enforces arity.
It means, if a lambda accepts 2 arguments but
if we're trying to pass it 3 arguments, then the
lambda will raise an error. On the other hand,
a `proc` will ignore the extra argument.

<Editor lang="ruby">
<code>
intro = lambda { |name|  puts "I am #{name}" }
intro.call("Mary")
</code>
</Editor>