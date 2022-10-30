We are working with the following code.

<Editor lang="ruby">
<code>
total = [5,6,7,8].inject(0) do |result, element|
  puts "Element is #{element}"
  result + element
end
puts total
</code>
</Editor>

Now let's use `puts` and print `result` for each iteration.

<Editor lang="ruby">
<code>
total = [5,6,7,8].inject(0) do |result, element|
  puts "Element is #{element}"
  puts "result is #{result}"
  result + element
end
puts total
</code>
</Editor>

What's happening is that the `result` parameter is changing every time.
It's the returend value of the block. Currently the block is returning `result + element`.
So for the first time when the loop is run then the value of `result` is zero and the value of element is 5.
Now the code processes two `puts` and then the code executes `result + element`. The output of that operation is `0 + 5` which is `5`. So this `5` becomes the new value for result.

For the second iteration the value of `result` is 5 and the value of `element` is 6. Now the same thing happens again. The last line is `5 + 6`. So the result of that operation is `11` and that becomes the new value for `result`.

For the third iteration the value of `result` is 11 and the value of `element` is 7. The last line returns `11 +7`. So the result of the operation is 18 which is the new value of `result` parameter.

For the fourth iteration the value of `result` is 18 and the value of `element` is 8. The last line returns `18 + 8`. So the result of the operaion is 26 which is the new value of `result` parameter.

Now no element is left. So the final value of `result` is the final output. The final value of `result` is 26 and that becomes the final output.

Remember that the value of `result` is changing in each iteration. The value of `element` is also changing but this is more straightforward. The next value of `element` will be from the array. But for `result` it's not that clearcut. The value of `result` depends on what the output of the block is. In this case the block is operating `result + element`.

In the next lesson we will take a different problem to understand the same concept again.