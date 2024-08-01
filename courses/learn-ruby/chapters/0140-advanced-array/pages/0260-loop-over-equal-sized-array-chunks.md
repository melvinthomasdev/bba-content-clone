The `each_slice` method in Ruby is used to iterate over 
an array in groups of a specified size, or slice. 

`each_slice` divides the array into consecutive slices 
of the specified size and yields each slice to the 
provided block. You can perform operations on each 
slice within the block, such as printing, processing, 
or aggregating data.

<codeblock language="ruby" type="lesson">
<code>
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers.each_slice(3) do |slice|
  puts slice.join(', ')
end
</code>
</codeblock>

If the array length is not evenly divisible by the 
slice size, the last slice will contain the remaining 
elements.

<codeblock language="ruby" type="lesson">
<code>
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers.each_slice(4) do |slice|
  puts slice.join(', ')
end
</code>
</codeblock>

If you don't provide a block, `each_slice` returns an 
enumerator, allowing you to chain it with other 
Enumerable methods.

<codeblock language="ruby" type="lesson">
<code>
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p numbers.each_slice(3).to_a
</code>
</codeblock>