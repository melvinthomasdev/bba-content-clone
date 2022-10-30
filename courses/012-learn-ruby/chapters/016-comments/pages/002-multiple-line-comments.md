There are two ways to
comment multiple lines.

One way is to use the same
style of using single line comments
for multiple lines.

<Editor lang="ruby">
<code>
# BigBinary Academy is a place to learn coding
# by actually coding.
# There is nothing to install.

puts "Hello BigBinary Academy!!!"
</code>
</Editor>

If we need to comment 10 or
more lines like this,
then it becomes tiresome
to keep adding `#` at the
beginning of each line.
In such cases, multiple line
comments can be used.
Multi-line comments start
with `=begin` and end with `=end`.

<Editor lang="ruby">
<code>
=begin
BigBinary Academy is a place to learn coding
by actually coding.
There is nothing to install.
=end

puts "Hello BigBinary Academy!!!"
</code>
</Editor>