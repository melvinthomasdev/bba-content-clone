The natural question that comes up is why we have both `left` and `right` merge. We just need to switch the order of arguments and keep one merge or deep merge function. To understand this, let's take a line from the Ramda docs:

**We aim for an implementation both clean and elegant, but the API is king. We sacrifice a great deal of implementation elegance for even a slightly cleaner API.**

Let's try to understand how this statement applies to the need for 2 merge functions with some examples.

## mergeLeft

Consider we receive a set of orders from an API call and we want to add the details of the current user to each order. Would we prefer `mergeLeft` or `mergeRight`?

```js
// We want to ensure every order object will have details of the current user.
const USER_DETAILS = {
  user: currentUser,
  deliveryAddress: currentUser.address
};

// main code
const { orders } = await ordersApi.fetch();

// mergeRight
return orders.map(order => mergeRight(order, USER_DETAILS));

// mergeLeft
return orders.map(mergeLeft(USER_DETAILS));
```

With the help of currying `mergeLeft` looks much better than `mergeRight`. This is how the above statement from Ramda applies to the need for 2 merge functions.

## mergeRight

Consider we receive a set of orders from an API call. We need to set some default values for `orderDispatched` and `shippingMode` if they do not exist in `order` object but not make changes if the keys are already present.

```js
const ORDER_DEFAULTS = {
  orderDispatched: false,
  shippingMode: "free"
};

// main code
const { orders } = await ordersApi.fetch();

// mergeLeft
return orders.map(order => mergeLeft(order, ORDER_DEFAULTS));

// mergeRight
return orders.map(mergeRight(ORDER_DEFAULTS));
```

Here `mergeRight` looks better than `mergeLeft`, so we prefer `mergeRight`.

## Conclusion

So which function do we prefer? We take into account 2 properties of Ramda functions:
- Ramda functions are curried by default.
- Data is always the last argument.

Taking these 2 properties into account, we can use the function that makes the code look cleaner.
