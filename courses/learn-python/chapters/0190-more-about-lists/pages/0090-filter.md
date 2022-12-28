Sometimes our list might contain values that we would like to filter out based on certain criteria. The `filter()` function in Python allows us to do the same.

The snippet below filters out all elements from `names` which are `None` while retaining the Strings.

<codeblock language="python" type="lesson">
<code>
names = ["Tom", "Bob", None, "Shirley", None, "Kajal"]

filtered_names = list(filter(lambda name: name is not None, names))
print(filtered_names)
</code>
</codeblock>

`filter()` takes in two arguments. The first is a function that provides the criteria for filtering. The second is the list that needs to be filtered. In the example above, `filter()` calls the Lambda function for every value in `names`. The function checks if the element is not `None`. The element is retained if it is not `None`.

