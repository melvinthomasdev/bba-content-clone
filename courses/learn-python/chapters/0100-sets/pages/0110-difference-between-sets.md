The `difference()` method of a set compares two sets and finds all the elements which are not present in the second set.

<image>difference.png</image>

In the example below Python compares `animals` with `more_animals` and returns all the elements which are present in `animals` but absent in `more_animals`.

<codeblock language="python" type="lesson">
<code>
animals = {"cat", "dog", "pig", "cow"}
more_animals = {"elephant", "dog", "pig", "chicken"}

uncommon_animals = animals.difference(more_animals)
print(uncommon_animals)
</code>
</codeblock>