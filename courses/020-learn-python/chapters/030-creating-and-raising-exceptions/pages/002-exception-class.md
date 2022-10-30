On the previous page, we *raised* an exception with a custom message. We created this exception using the `Exception` class. 

The `Exception` class is imported by default when Python starts. We can use it to create an `Exception` object with a custom message and any other details we need.

<Editor lang="python">
<code>
raise Exception("Failure detected.", {"data": [1, 2, 3]})
</code>
</Editor>

The `Exception` object takes in a variable number of arguments. So we can pass it any number and types of data related to the error we face.

