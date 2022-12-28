If an array has `nil` items
and
we want to remove these `nil` items,
then we can use `compact`.

<codeblock language="ruby" type="lesson">
<code>
array1 = [1, 2, nil, 4, "6", nil, "John"]

array2 = array1.compact

puts array1
puts array2
</code>
</codeblock>

As we can see, `array2`
does not have any nil items.

Whereas, `array1` still has the nil items.

`compact` returns a **new**
array which removes all `nil`
items.