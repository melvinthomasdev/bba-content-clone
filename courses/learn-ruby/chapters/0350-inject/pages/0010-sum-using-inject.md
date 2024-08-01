Understading how `inject` works would take some time.
So please don't get frustrated if you don't understand it first time.
We are going to look at `inject` with various examples in coming lessons
so that it gets clearer with each lesson.

First let's take an example. Let's say that we have an array of items and we
want to add all the items. Here is how we can add all the items of the array.

<codeblock language="ruby" type="lesson">
<code>
[5,6,7,8].each do |element|
  total = total + element
end
puts total
</code>
</codeblock>

In the above case we had to create a variable called `total` and we kept adding values to `total` to get
the final result. This works. However we can solve this problem much more easily using `inject`. First let's see what the code would look like if we are using `inject`.

<codeblock language="ruby" type="lesson">
<code>
puts [5,6,7,8].inject(0) { |result, element| result + element }
</code>
</codeblock>

## Understanding inject

In order for us to understand what's going on we are going to add `puts` statement.
First let's change the same code to use `do end` style. Here is the modified code.
It's the same code with different style.

<codeblock language="ruby" type="lesson">
<code>
total = [5,6,7,8].inject(0) do |result, element|
  result + element
end
puts total
</code>
</codeblock>

Here is how it works.

For the first time the value of `result` is zero because we are passing that value.
The value of `element` is `5`.
Now we perform `result + element`.
So in this case we do `0 + 5`.
"0 + 5" is 5. And this "5" becomes the new value for `result`.

For the second time the value of `result` is "5".
The value of `element` is 6.
Now we perform `result + element`.
So in this case we do `5 + 6`.
"5 + 6" is 11. And this "11" becomes the new value for `result`.

For the third time the value of `result` is "11".
The value of `element` is 7.
Now we perform `result + element`.
So in this case we do `11 + 7`.
"11 + 7" is 18. And this "18" becomes the new value for `result`.

For the fourth time the value of `result` is "18".
The value of `element` is 8.
Now we perform `result + element`.
So in this case we do `18 + 8`.
"18 + 8" is 26. And this "26" becomes the new value for `result`.

We are done with all the elements so `inject` method will return
the final value of `result` which is 26.


Let's print each element value in `inject`.

<codeblock language="ruby" type="lesson">
<code>
total = [5,6,7,8].inject(0) do |result, element|
  puts "Element is #{element}"
  result + element
end
puts total
</code>
</codeblock>

So now we know that the second parameter in the block is the element which changes with each iteration.