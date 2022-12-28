Another way to map elements in Python is by using List Comprehension. List comprehension is an inline for loop, which can be used to quickly iterate over and process elements of a list.

<codeblock language="python" type="lesson">
<code>
names = ["Robb", "Brandon", "Jon", "Theon"]
names_with_salutation = ["Mr." + name for name in names]
print(names_with_salutation)
</code>
</codeblock>

We can also filter out elements using list comprehension.

<codeblock language="python" type="lesson">
<code>
names = ["Tom", "Bob", None, "Shirley", None, "Kajal"]
filtered_names = [name for name in names if name is not None]
print(filtered_names)
</code>
</codeblock>

The syntax for list comprehension is the following:

**\[(return value) for value in list if (condition)\]**

