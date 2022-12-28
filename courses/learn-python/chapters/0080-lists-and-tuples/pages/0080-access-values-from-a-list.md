Accessing values from a list is done by using **indices**. Indices are numbers that are assigned to each value in the list based on their position. It begins from 0 and goes on until the length of the list - 1.


<image>list.png</image><codeblock language="python" type="lesson">
<code>
list_of_animals = ['cat', 'dog', 'sheep', 'horse']
print(list_of_animals[0])
print(list_of_animals[1])
print(list_of_animals[2])
print(list_of_animals[3])
</code>
</codeblock>

Note that Python will throw an error if we try to access an index which does not exist.

<codeblock language="python" type="lesson">
<code>
list_of_animals = ['cat', 'dog', 'sheep', 'horse']
print(list_of_animals[4])
</code>
</codeblock>