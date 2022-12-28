<codeblock language="ruby" type="lesson">
<code>
def greet
  puts "Good morning"
  yield
  puts "Good evening"
end

greet { puts "Roger Smith" }
</code>
</codeblock>

In the case given above, the greet
method is not explicitly accepting
any block. Implicitly, all methods can
accept a block.
That's how Ruby is structured.

However, Ruby also allows us to
explicitly accept a block.
In order to do so,
the argument must start with an `&`.
Usually, such arguments are named `&block`.

<codeblock language="ruby" type="lesson">
<code>
def greet(&block)
  puts "Good morning"
  block.call
  puts "Good evening"
end

greet { puts "Roger Smith" }
</code>
</codeblock>