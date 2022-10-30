`filter` selects all the elements which return true for the give condition.
What if we want just the first element for which the given condition is true.
Well we can use `filter` and then select the first element but that would be wastage of the computational resource. Why ask computer to do all the work on checking all the elements if they pass the given condition
or not.

We can use `find` to select the very first element that passes the test.
For example we want to know the first number which is greater than 10.

<Editor lang="ruby">
<code>
def number_finder(array)
  array.find do |element|
    element > 10
  end
end

array = [4, 8,7,3,13, 9,7, 11]
puts number_finder(array)
</code>
</Editor>