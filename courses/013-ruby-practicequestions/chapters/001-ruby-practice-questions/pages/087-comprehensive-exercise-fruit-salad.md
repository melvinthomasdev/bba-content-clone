Finish the method definition given below.

Given an array of fruits as strings `fruits`, the method `fruit_salad` should perform the following.

- Slice name of each fruit in half.
- Sort the chunks that were sliced in previous step alphabetically.
- Join the alphabetically sorted chunks and return a string.

<br>
<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def fruit_salad(fruits)
  # Write your code here
end
</code>

<solution>
def fruit_salad(fruits)
  fruits.map{ |fruit| slice_it(fruit) }.flatten.sort.join
end

def slice_it(fruit)
  middle = fruit.length/2
  length = fruit.length
  [fruit.slice(0..middle-1), fruit.slice(middle..length)]
end
</solution>

<testcases>
<caller>
puts fruit_salad(fruits)
</caller>
<testcase>
<i>
fruits = %w[apple pear grapes]
</i>
</testcase>
<testcase>
<i>
fruits = %w[raspberries mango]
</i>
</testcase>
<testcase>
<i>
fruits = %w[banana]
</i>
</testcase>
<testcase>
<i>
fruits = %w[blueberries kiwi orange grapefruit]
</i>
</testcase>
</testcases>
</Editor>