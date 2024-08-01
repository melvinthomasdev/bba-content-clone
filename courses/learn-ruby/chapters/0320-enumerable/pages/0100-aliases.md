Ruby has aliases for a lot of methods.
For example if you open Ruby
[Enumerable](https://ruby-doc.org/core-3.1.2/Enumerable.html)
documentation and if you look at the sidebar then you will see method like `find_all`.
However when you click on that then you will see this.

```
select {|element| ... } → array
select → enumerator
```

What it means is that `find_all` is an `alias` for `select`.
In your code you can write `find_all` or `select` and it would do the same thing.

Similarly let's see method `collect` in the sidebar.
Once you click on it you will be taken to the method `map`.
Method `collect` is an alias to method `map`.
