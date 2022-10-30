Ruby **blocks** allow a section of
code to be passed to methods
without first storing that
section of code into any variable.

<Editor lang="ruby">
<code>
[1, 2, 3].each { puts "hello" }
</code>
</Editor>

In the case given above,
`{ puts "hello" }` is the section of code
that is being passed to the method `each`.
As we can see, this section of code is not
stored in a variable first.
That's why, some people say
that Ruby blocks are used to
pass **anonymous** code
to methods.

Here, by anonymous, the only thing
they mean is that the block of code
is not first stored in a variable.

Let's look at one more example.
In this case, the code inside
the `do end` is a **Ruby block**.

<Editor lang="ruby">
<code>
[1, 2, 3].each do
  puts "hello"
end
</code>
</Editor>

Here are two more examples of Ruby blocks:

<Editor lang="ruby">
<code>
4.times { puts "Good day" }

4.times do
  puts "Good evening"
end
</code>
</Editor>