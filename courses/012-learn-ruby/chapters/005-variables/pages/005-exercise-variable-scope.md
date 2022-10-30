Run the code shown here
and
you will get an error.
Change the code so that the error goes away
and our code works.

<Editor lang="ruby" type="exercise">
<code>
numbers = [1,2,3,4,5]

numbers.each do |item|
  numbers2 = []
  numbers2.push(item * 2)
end

puts numbers2
</code>

<solution>
numbers = [1,2,3,4,5]

numbers2 = []
numbers.each do |item|
  numbers2.push(item * 2)
end

puts numbers2
</solution>
</Editor>