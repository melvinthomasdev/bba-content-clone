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

While `each_with_index` is convenient, you might 
encounter situations where you need more control 
over the iteration. This is where `with_index` 
comes into play. The `with_index` method can be 
applied to an enumerator, providing additional 
flexibility:


<codeblock language="ruby" type="lesson">
<code>
names = %w(John Mary Adam)
names.to_enum.with_index(1).each do |name, index|
  puts "#{name} is at position #{index}"
end
</code>
</codeblock>

Here, `to_enum` is used to create an enumerator 
for `names`, and `with_index(1)` specifies that 
the index should start from one. By providing an 
argument to `with_index`, we can set a custom 
starting index. The end result is the same as 
our adjusted `each_with_index` example.