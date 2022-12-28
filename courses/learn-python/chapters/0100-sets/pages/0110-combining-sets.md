The `.union()` method can be used to combine two sets. The difference between `.update()` and `.union()` is that `.union()` returns a combined set while `.update()` will update the first set with the values of the second.

<image>union.png</image><codeblock language="python" type="lesson">
<code>
places_set = {"Paris", "Stockholm", "London"}
more_places_set = {"Paris", "London", "New York"}

print(places_set.union(more_places_set))
</code>
</codeblock>