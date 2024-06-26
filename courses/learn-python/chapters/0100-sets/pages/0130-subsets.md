The `issubset()` method of a set checks if all the elements from the first set exist in the second set. It returns a boolean of either `True` or `False`.

<image>subset.png</image><codeblock language="python" type="lesson">
<code>
set_1 = {1, 2, 3, 4, 5, 6}
set_2 = {1, 2, 3}
print(set_2.issubset(set_1))

set_1 = {1, 2, 3, 4, 5, 6}
set_2 = {8, 9, 10}
print(set_2.issubset(set_1))

</code>
</codeblock>
