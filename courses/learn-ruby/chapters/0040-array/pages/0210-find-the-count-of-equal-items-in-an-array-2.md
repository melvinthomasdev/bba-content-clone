The **tally** method also
accepts a hash as an optional argument.

Instead of returning a
new hash as the output,
the **tally** method will
update the values of
this hash and return it.

This is useful when
accumulating a count
of values in multiple
arrays.

Let us take a look at an example:

```
tallied_animals = {}

animal_group_1 = ["Cat" ,"Cat" , "Dog", "Sloth"]

animal_group_2 = ["Sloth", "Elephant", "Tiger"]

animal_group_3 = ["Dog", "Tiger", "Cat"]

animal_group_1.tally(tallied_animals)
animal_group_2.tally(tallied_animals)
animal_group_3.tally(tallied_animals)

puts tallied_animals
```

The hash
**tallied_animals** will be
updated with the count 
of all animals
present in each of the
three arrays. This will be 
the solution:
`{"Cat"=>3, "Dog"=>2, "Sloth"=>2, "Elephant"=>1, "Tiger"=>2}`


Note: _We don't show this example in our 
code editor because currently our code 
editor doesn't support Ruby version 3.1 and 
above. Using Tally method with an 
argument was introduced in these updates. Once 
we update our editor, we'll change this lesson 
to have a code example._
