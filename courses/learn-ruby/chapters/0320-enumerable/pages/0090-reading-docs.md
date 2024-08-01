Let's look at the documentation for method
[select](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-select).

The documentation has following two lines at the top.

```
select {|element| ... } → array
select → enumerator
```

In the first line what the documentation is saying that the method `select` take a block.
What comes after the "→" means that the method will return.
In this case the first line is returning an array.
In other words if a block is passed to `select` then it will return an array.

The second line says that if no block is passed then an `enumerator` will be returned.
`enumerator` is an advance topic and currently we are not discussing it.

### Docs for method map

Let's take one more example. we are going to see the documentation for
[map](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-map).

Here also we see the same thing.

```
map {|element| ... } → array
map → enumerator
```

### Docs for method max

Now let's see the documentation for method [max](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-max).

```
max → element
max(n) → array
max {|a, b| ... } → element
max(n) {|a, b| ... } → array
```

Here we can see that `max` can be used in four different ways and in different conditions it returns different thing.

* Line 1: If no argument is passed then it returns an element.
* Line 2: If a number is passed then it returns an array.
* Line 3: If a block is passed then it returns an element.
* Line 4: If both a number and a block is passed then it returns an array.