Let's say that we have an array of 6 numbers and
we want to get only the even numbers.
Here is how we can do that.

<codeblock language="ruby" type="lesson">
<code>
def number_selector(array)
  even_numbers = []
  array.each do |element|
    even_numbers << element if element.even?
  end

  even_numbers
end

array = [4,8,7,3,9,7]
puts number_selector(array)
</code>
</codeblock>

Ruby provides method `filter` which can help us to this in a much simpler way.
First let's see how to use `filter`.

<codeblock language="ruby" type="lesson">
<code>
def number_selector(array)
  array.filter do |element|
    element.even?
  end
end

array = [4,8,7,3,9,7]
puts number_selector(array)
</code>
</codeblock>

Notice that how much shorter the code is with `filter`.

Just like `map`, `filter` also internally builds an array for us and that's why
we don't need to build an array. All we need to do is to tell `filter`
a condition that it needs to apply on each of the elements.
If an element passes the condition then add that element to the array else reject that element.

Let's see one more example.
We have an array full of strings and
we only want strings which has more than five letters.

<codeblock language="ruby" type="lesson">
<code>
def selector(array)
  big_words = []
  array.each do |element|
    big_words << element if element.size > 5
  end

  big_words
end

array = ["France", "India", "England", "Australia"]
puts selector(array)
</code>
</codeblock>

We can solve this using `filter` like this.

<codeblock language="ruby" type="lesson">
<code>
def selector(array)
  array.filter do |element|
    element.size > 5
  end
end

array = ["France", "India", "England", "Australia"]
puts selector(array)
</code>
</codeblock>