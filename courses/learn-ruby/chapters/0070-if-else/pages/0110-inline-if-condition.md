In general we write
`if` conditions like this:

<codeblock language="ruby" type="lesson">
<code>
number = 8
if number < 10
  puts "Number is less than 10"
end
</code>
</codeblock>

Simple `if` conditions can
be written without an `end`:

<codeblock language="ruby" type="lesson">
<code>
number = 8
puts "Number is less than 10" if number < 10
</code>
</codeblock>

This is called an **inline if**.