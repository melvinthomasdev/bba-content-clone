A block can also accept arguments.
Here is an example:

<Editor lang="ruby">
<code>
[1, 2, 3].each { |n| puts n }
</code>
</Editor>

When a method accepts an argument,
then the argument is inside `( )`.
However, when a block accepts an argument,
then the argument is inside `| |`.

Here is another example of a block
accepting arguments:

<Editor lang="ruby">
<code>
5.times do |n|
  puts n
end
</code>
</Editor>