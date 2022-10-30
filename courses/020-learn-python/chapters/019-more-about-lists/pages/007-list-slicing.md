Similar to Strings, we can also slice a List by providing a range of indices within \[`x:y]`. If we don't provide the `x` index, all elements starting from `0` up to `y` will be fetched. If we don't provide the `y` index, all values starting from x until the end of the list will be fetched.

<Editor lang="python">
<code>
colors = ["red", "pink", "white", "yellow", "grey", "blue"]
print(colors[0:4])
print(colors[3: 6])
print(colors[4:])
print(colors[:4])
</code>
</Editor>

We could also use negative indices.

<Editor lang="python">
<code>
colors = ["red", "pink", "white", "yellow", "grey", "blue"]
print(colors[-3:])
print(colors[2: -2])
</code>
</Editor>