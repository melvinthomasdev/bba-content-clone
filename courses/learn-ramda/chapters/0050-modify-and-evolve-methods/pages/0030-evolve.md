`modify` and `modifyPath` functions have the same disadvantage as `assoc` and `assocPath`. They can't update multiple properties simultaneously.

The `evolve` function helps us in such scenarios. `evolve` takes an object that specifies a transformation function for each property to be transformed. It can be done at multiple levels of nesting.

As with `modify` and `modifyPath`, `evolve` will not add new keys. If you specify a transformation for a key that doesn’t appear in the original object, it will be ignored.

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

const newOrder = evolve(
  {
    quantity: inc,
    customer: {
      name: () => "Oliver",
      isNewUser: always(true),
      address: {
        city: prevValue => concat(prevValue, " City")
      },
    },
  },
  order
);
/*
New key `isNewUser` is not added.
{
  id: 1,
  name: "ORD1",
  quantity: 11, //=> quantity incremented
  customer: {
    name: "Oliver", //=> name updated
    address: {
      city: "Miami City", //=> city updated
      pin: 111111,
    }
  }
};
*/
```
In the above code `() => "Oliver"` is used to always return the value "Oliver". We cannot just write `name: "Oliver"` because `evolve` accepts only functions as values.

The Ramda function `always` directly returns its argument without any modification. So both `() => "Oliver"` and `always("Oliver")` are identical. We could have also written:
```js
name: always("Oliver")
```
