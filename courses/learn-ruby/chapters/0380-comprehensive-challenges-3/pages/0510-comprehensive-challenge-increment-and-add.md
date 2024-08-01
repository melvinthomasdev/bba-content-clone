Complete the method definition given below.

Given an integer count, increment the same by 1 and add it to the present count value. Continue the same till count value reaches maximum count. The method should return the final sum.


Note:

1. The count should increment atleast once irrespective of the maximum count.
2. Order matters: You need to first increment count, and then get the sum.

```
( ie, for (count = 2): 2 + 1 = 3; 2 + 3 = 5)
```

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def increment_count(count, maximum_count)
  # Write your code here
end
</code>

<solution>
def increment_count(count, maximum_count)
  sum = 0
  loop do
    count +=1
    sum += count
    break if count >= maximum_count
  end

  sum
end
</solution>

<testcases>
<caller>
puts increment_count(count, maximum_count)
</caller>
<testcase>
<i>
count = 3
maximum_count = 7
</i>
</testcase>
<testcase>
<i>
count = 1
maximum_count = 10
</i>
</testcase>
<testcase>
<i>
count = 21
maximum_count = 21
</i>
</testcase>
<testcase>
<i>
count = 4
maximum_count = 3
</i>
</testcase>
</testcases>
</codeblock>
