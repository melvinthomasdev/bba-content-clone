We saw that we can use `map` like this.

<codeblock language="ruby" type="lesson">
<code>
def capitalizer(array)
  array.map { |element| element.capitalize }
end

array = ["france", "india", "england"]
puts capitalizer(array)
</code>
</codeblock>

We can make the code even shorter. First let's see the shorter version.

<codeblock language="ruby" type="lesson">
<code>
def capitalizer(array)
  array.map(&:capitalize)
end

array = ["france", "india", "england"]
puts capitalizer(array)
</code>
</codeblock>

Similarly we can find all the even elements in a given array.

<codeblock language="ruby" type="lesson">
<code>
def even_finder(array)
  array.filter(&:even?)
end

array = [1, 2, 3, 4, 5,6]
puts even_finder(array)
</code>
</codeblock>

Let's say that we have an array full of numbers but they are in `String` format.
We need to apply `to_i` on them to convert them to integers. We can do that like this.

<codeblock language="ruby" type="lesson">
<code>
def numericalize(array)
  array.map(&:to_i)
end

array = ["1", "2", "3", "4", "5", "Book"]
puts numericalize(array)
</code>
</codeblock>

Notice that the last value in the result is zero.
That's because `to_i` on "Book" would be zero.

This trick works because Ruby converts all these symbols into procs.
We will discuss how this works in later chapters. This concept is called "Symbol to Proc" and that's why
the name of this chapter is "Symbol to Proc".

Remember that anything that starts with `:` is a symbol. In this case we are using `&:capitalize`.
Here it looks a bit odd but `:capitalize` is a Symbol.