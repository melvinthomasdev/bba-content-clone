Let's say that we have an array of 6 numbers and we need to double all those numbers.
Here is how we can do that.

<Editor lang="ruby">
<code>
def doubler(array)
  doubled_array = []
  array.each do |element|
    doubled_array << element * 2
  end

  doubled_array
end

array = [4,8,7,3,9,7]
doubled = doubler(array)
puts doubled
</code>
</Editor>

Ruby provides method `map` which can help us to this in a much simpler way.
First let's see how to use `map`.

<Editor lang="ruby">
<code>
def doubler(array)
  array.map do |element|
    element * 2
  end
end

array = [4,8,7,3,9,7]
doubled = doubler(array)
puts doubled
</code>
</Editor>

Notice that how much shorter the code is with `map`.

`map` internally builds an array for us and that's why
we don't need to build an array. All we need to do is to tell `map`
how to calculate the new value that will go into the array.
In this case we are multiplying each element with 2.

Let's see one more example.
We have an array full of strings and we need to make the first letter a capital letter.
First let's see how we can do it by keeping an array outside and then adding to the array ourselves.

<Editor lang="ruby">
<code>
def capitalizer(array)
  capitalized_array = []
  array.each do |element|
    capitalized_array << element.capitalize
  end

  capitalized_array
end

array = ["france", "india", "england"]
puts capitalizer(array)
</code>
</Editor>

We can solve this using `map` like this.

<Editor lang="ruby">
<code>
def capitalizer(array)
  array.map do |element|
    element.capitalize
  end
end

array = ["france", "india", "england"]
puts capitalizer(array)
</code>
</Editor>

If the code in the block is of only one line then the code can be written like this.

<Editor lang="ruby">
<code>
def capitalizer(array)
  array.map { |element| element.capitalize }
end

array = ["france", "india", "england"]
puts capitalizer(array)
</code>
</Editor>

Now you can see that using `map` the code becomes much simpler.
Notice that when we are using `map` then all the things that we do not need to do.

- We do not need to create a new array.
- We do not need to push the values to this new array.
- We do not need to return this new array.

All this work is done by `map` and that means we need to do less work.
By using `map` we end up with less work and hence less amount of code.

Next time if you are creating an array for the sole purpose of collecting
transformed value then pause and think if you could use `map` in that scenario.
