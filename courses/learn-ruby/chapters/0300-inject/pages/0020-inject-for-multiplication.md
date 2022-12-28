Let's take another example. However this time we will have multiplication instead of addition.

<codeblock language="ruby" type="lesson">
<code>
total = [2,3,4,5].inject(0) do |result, element|
  result * element
end
puts total
</code>
</codeblock>

The final result is 0. Let's put some `puts` statements to debug this.

<codeblock language="ruby" type="lesson">
<code>
total = [2,3,4,5].inject(0) do |result, element|
  puts "result is #{result} and element is #{element}"
  result * element
end
puts total
</code>
</codeblock>

We can see that the very first time `result` is 0 and `element` is 2.
Multiplying anything with zero will result in zero. Question is why resutl is 0
the very first time.

The value of `result` for the for very time is passed in the inject method.
In this case see we are passing 0 in `inject(0)`.

In the previous lesson we were doing addition so passing 0 as the starting value of `result` was ok.
However this time we are doing multiplication so we should change the value to 1.

<codeblock language="ruby" type="lesson">
<code>
total = [2,3,4,5].inject(1) do |result, element|
  puts "result is #{result} and element is #{element}"
  result * element
end
puts total
</code>
</codeblock>

For the first iteration the value of `result` is 1 and the value of `element` is 2. The returned value is `1 * 2` which is 2. Now 2 is the new value of `result`.

For the second iteration the value of `result` is 2 and the value of `element` is 3. The returned value is `2 * 3` which is 6. Now 6 is the new value of `result`.

For the third iteration the value of `result` is 6 and the value of `element` is 4. The returned value is `6 * 4` which is 24. Now 24 is the new value of `result`.

For the fourth iteration the value of `result` is 24 and the value of `element` is 5. The returned value is `24 * 5` which is 120. Now 120 is the new value of `result`.

Since all elements are used up the final value of the whole operation is 120.