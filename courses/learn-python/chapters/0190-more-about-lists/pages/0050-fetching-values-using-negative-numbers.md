If we want to fetch values from the end of the list, we can use negative numbers as indices.

In the following code snippet, `-1` will return the last element in the list.
`-2` will return the second last element in the list.

<codeblock language="python" type="lesson">
<code>
colors = ["red", "pink", "white", "yellow", "grey", "blue"]
print(f"The last element in the list is {colors[-1]}")
print(f"The second last element in the list is {colors[-2]}")
print(f"The third last element in the list is {colors[-3]}")
</code>
</codeblock>