Look at the code given below:

<codeblock language="ruby" type="lesson">
<code>
names = %w(John Mary Adam)
names.each_with_index do |name, index|
  puts "#{name} is at position #{index}"
end
</code>
</codeblock>

When we use `each_with_index`
then along with the value in the array,
we also get the
position of each value.

Note that the first position is zero.
Our users might not
like the first position as zero.
This is how we can fix it:

<codeblock language="ruby" type="lesson">
<code>
names = %w(John Mary Adam)
names.each_with_index do |name, index|
  puts "#{name} is at position #{index + 1}"
end
</code>
</codeblock>