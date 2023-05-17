The gap operator (__) is a special function in Ramda to make currying even easier. Till now, we learned that data is always passed last so that it can be curried. But, there can be cases where we want to curry one of the earlier arguments instead of the data.

The gap operator helps us here. It acts as a placeholder function that gets replaced with the curried argument. For example, let's take the case of our `order` object. We need to append "City" to `customer.address.city`.
```js
const order = {
  id: 1,
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "John",
    address: {
      city: "Miami",
      pin: 111111,
    }
  }
};

modifyPath(["customer", "address", "city"], prevValue => concat(prevValue, " City"), order);
```

Here we needed to curry `prevValue` to make the code look shorter, but since the data is not the last argument in this case, we cannot apply the normal currying rules we learned.

This is where `__` helps us. We write the above code as follows:
```js
modifyPath(["customer", "address", "city"], concat(__, " City"), order);
```

Now, `prevValue` is curried as we've seen till now, but this value does not go to the last argument of `concat`. Instead, `__` is replaced by `prevValue` and the code would work as earlier.

Let's see another example. Consider that we need to retrieve the top N names in a list.
```js
const names = ["Mater", "Sally", "McQueen", "Guido", "Hudson"];

const getTopN = n => slice(0, n, names);
```

We would not be able to use normal currying here because the value to be curried is in the middle. Again, let's use `__` to solve this as shown:
```js
const getTopN = slice(0, __, names);
```

The `__` helps us to make use of currying again. The second argument gets curried here.

We can also use multiple `__` placeholders in a function and the curried arguments will be supplied in order:
- `f(__, b, c)(a)` gets called as `f(a, b, c)`.
- `f(__, __, c)(a)(b)` gets called as `f(a, b, c)`.
