If an array has duplicate items,
then we can use `uniq` to remove
all the duplicates.

<codeblock language="ruby" type="lesson">
<code>
array1 = [1, 2, 2, 3, 4, 4, 4, 5, 5, 6, 7, 7]

array2 = array1.uniq

puts array1
puts array2
</code>
</codeblock>

As we can see, `array2`
does not have any duplicate
items.

Whereas, `array1` still has the
duplicate items.

`uniq` returns a **new**
array which removes all duplicate
items.