`yield` is a special thing in Ruby.
Using `yield`, a method can
ask a block to be executed.

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

Here, the method first prints **Good morning**.
Then, the method yields the control to the block.
Once the block is processed, then the method gets
the control back
and
then the method prints **Good evening**.

If the method does not get a block to execute, then
the method will raise an error.
Let's try it out and this time no block will be
passed to the method.

You should get an error in the case given below:

<codeblock language="ruby" type="lesson">
<code>
def greet
  puts "Good morning"
  yield
  puts "Good evening"
end

greet
</code>
</codeblock>

We want to `yield` to a block
only if a block is passed.
There is no point in yielding
to a block if there is no block.
We can solve this by using the `block_given?` method.
`block_given?` would return
**true** if a block is passed.

<codeblock language="ruby" type="lesson">
<code>
def greet
  puts "Good morning"
  yield if block_given?
  puts "Good evening"
end

greet
</code>
</codeblock>

If a block is passed, then that block
will be evaluated.

<codeblock language="ruby" type="lesson">
<code>
def greet
  puts "Good morning"
  yield if block_given?
  puts "Good evening"
end

greet { puts "Roger Smith" }
</code>
</codeblock>