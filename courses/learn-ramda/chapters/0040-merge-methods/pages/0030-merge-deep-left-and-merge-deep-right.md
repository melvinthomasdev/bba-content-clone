There can be situations where we want to merge nested properties into an object. For that, we can use `mergeDeep` functions. There are 2 functions, namely, `mergeDeepLeft` and `mergeDeepRight`. They overwrite the primitive values, but instead of overwriting the nested objects, they recursively merge the nested objects.

To differentiate between the two `mergeDeep` functions, we can think as follows. For `mergeDeepLeft` the right side values are overwritten by the left side values if they are of primitive data types and vice versa in `mergeDeepRight`.

Let's look at both `mergeDeepLeft` and `mergeDeepRight` with an example.

## mergeDeepLeft

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

const changes = {
  id: 2,
  customer: {
    name: "Oliver",
    email: "oliver@example.com"
  }
};

console.log(R.mergeDeepLeft(changes, order));
/*
{
  id: 2, //=> sets id as 2
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "Oliver", //=> sets name as Oliver
    email: "oliver@example.com", //=> adds a new key "email" with value "oliver@example.com"
    address: {
      city: "Miami",
      pin: 111111,
    }
  }
}
*/
```

As you can see, the `id` key got replaced by the value from the left (or first) object `changes` while `customer` key of `order` didn't get fully overwritten, but rather `customer.email` got added, and `customer.name` from `order` got overridden by the value from `changes`, and the rest of the properties from `order` were retained as it was.

## mergeDeepRight

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

const changes = {
  id: 2,
  customer: {
    name: "Oliver",
    isAdmin: true
  }
};

console.log(R.mergeDeepRight(order, changes));
/*
{
  id: 2, //=> id updated
  name: "ORD1"
  quantity: 10,
  customer: {
    isAdmin: true, //=> a property that order doesn't have
    name: "Oliver", //=> name updated
    address: {
      city: "Miami",
      pin: 111111
    },
  },
}
*/
```

As you can see, the value of the `id` key was taken from the right (`changes`) object. `customer.isAdmin` which is present in the `changes` object got added and the value for `customer.name` was taken from `changes`.
