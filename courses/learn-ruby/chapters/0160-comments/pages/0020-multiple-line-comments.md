There are two ways to
comment multiple lines.

One way is to use the same
style of using single line comments
for multiple lines.

<codeblock language="ruby" type="lesson">
<code>
# BigBinary Academy is a place to learn coding
# by actually coding.
# There is nothing to install.

puts "Hello BigBinary Academy!!!"
</code>
</codeblock>

If we need to comment 10 or
more lines like this,
then it becomes tiresome
to keep adding `#` at the
beginning of each line.
In such cases, multiple line
comments can be used.
Multi-line comments start
with `=begin` and end with `=end`.

<codeblock language="ruby" type="lesson">
<code>
=begin
BigBinary Academy is a place to learn coding
by actually coding.
There is nothing to install.
=end

puts "Hello BigBinary Academy!!!"
</code>
</codeblock>