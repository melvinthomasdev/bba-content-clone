You are given an array which has some numbers.
Add 100 to each of those numbers and print the new numbers.
Solve this problem using `map`.

<Editor lang="ruby" type="exercise">
<code>
def adder(array)
end

puts adder([5,8,3,8,9])
</code>

<solution>
def adder(array)
  array.map do |element|
    element + 100
  end
end

puts adder([5,8,3,8,9])
</solution>
</Editor>