In this lesson we are going to ephasize once again that
in Ruby the correct way is not to use an external accumulator
as shown below.

```
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
```

Here what we are doing is that we are keeping an external accumulator `doubled_array` and to
this array we keep putting the transformed values.

Anytime we are keeping an external accumulator like this then we need to pause and think
what exactly we are trying to do here. Are we doing data transformation. In the above case
we are taking each element and we are transforming the data and then we are pushing the transformed
data to the external accumulator. Well we have `map` to handle data transformations.

In some cases we don't want data transformation but we want to filter the records. For that we can use
[filter](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-filter)
or
[reject](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-reject).

Sometimes we want the first element that matches the given condition. For that use [find](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-detect).

If you want to select all the elements then use
[find_all](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-find_all)
which is an `alias` for method `select`.
