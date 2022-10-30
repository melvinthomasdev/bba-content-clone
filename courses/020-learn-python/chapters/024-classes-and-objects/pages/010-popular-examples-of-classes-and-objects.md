We have already come across objects and classes in the previous chapter. For example, the `Counter` class from the `collections` module is a popular example of a Class.

The `Counter` class has methods and attributes that help count the frequency of each element in a sequence. We can create an object of `Counter` by passing in a list, string or tuple. `Counter` will measure the frequency of every element in the list and return an object containing the results.

<Editor lang="python">
<code>
from collections import Counter # import class

counter = Counter("hello world") # Count frequency
print(counter.most_common()) # print most common using .most_common() method
</code>
</Editor>