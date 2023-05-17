The `modifyPath` function is to `modify` what `assocPath` is to `assoc`. We use it when we want to modify a nested property which `modify` cannot do. As with `modify`, it cannot create new keys with new values. It can only modify the values of existing keys.

Consider we want to add the title "Mr" to `customer.name` in the following `order` object:
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

// Vanilla JS without modifying original object
const newOrder = {
  ...order,
  customer: {
    ...order.customer,
    name: `Mr ${order.customer.name}`
  }
}

// modifyPath from Ramda
modifyPath(["customer", "name"], prevValue => concat("Mr ", prevValue), order);

// prevValue of name is curried
modifyPath(["customer", "name"], concat("Mr "), order);
/*
{
  id: 1,
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "Mr John", //=> Value changed to "Mr John"
    address: {
      city: "Miami",
      pin: 111111,
    }
  }
}
*/
```
