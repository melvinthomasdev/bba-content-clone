Understading how `inject` works would take some time.
So please don't get frustrated if you don't understand it first time.
We are going to look at `inject` with various examples in coming lessons
so that it gets clearer with each lesson.

First let's take an example. Let's say that we have an array of items and we
want to add all the items.

<Editor lang="ruby">
<code>
puts [5,6,7,8].inject(0) { |result, element| result + element }
</code>
</Editor>

We get the result. That's great.
In order for us to understand what's going on we are going to add `puts` statement.
First let's change the same code to use `do end` style. Here is the modified code.
It's the same code with different style.

<Editor lang="ruby">
<code>
total = [5,6,7,8].inject(0) do |result, element|
  result + element
end
puts total
</code>
</Editor>

We will look at `result` in the next lesson. Here we need to understand that just like `each_with_index` in an array the block is executed once for each item in the array. Let's see a use of `each_with_index`.

<Editor lang="ruby">
<code>
[5,6,7,8].each_with_index do |name, index|
  puts "#{name} is at position #{index}"
end
</code>
</Editor>

In `each_with_index` we execute the `do end` block once for each item. And in every single iteration the value of `name` is a value from the array.

Simiarly in the case of `inject` for each iteration the value of `element` changes. However notice that in the case of `inject` the element comes at the second position. The first position is taken by `result` which will talk about in the next chapter.

Let's print each element value in `inject`.

<Editor lang="ruby">
<code>
total = [5,6,7,8].inject(0) do |result, element|
  puts "Element is #{element}"
  result + element
end
puts total
</code>
</Editor>

So now we know that the second parameter in the block is the element which changes with each iteration.