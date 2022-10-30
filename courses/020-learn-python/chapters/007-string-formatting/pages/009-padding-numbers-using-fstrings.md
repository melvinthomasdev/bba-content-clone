Sometimes we would like to print our numbers with a fixed length. For example, printing military time. ie. 0900 hours, we can use the inbuilt string formating syntax to print numbers in a fixed length.

<Editor lang="python">
<code>
print(f"We will depart at {900:04d} hours")
</code>
</Editor>

In the example above, we print 900, followed by `04d` which basically pads the numbers with zeros to the left if the number has less than 4 digits.