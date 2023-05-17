An obvious limitation of `assoc` functions is that they cannot update multiple properties at a time. We need to write multiple `assoc` statements. This is where `merge` functions come into the picture. They can update multiple properties in a single statement.

As its name indicates `merge` functions accept two objects as arguments and merge all their properties into a single new object. If the same key exists in both the input objects, one of them will be given priority over the other based on which merge function we are using.

There are `mergeLeft` and `mergeRight` functions. `mergeLeft` will give higher priority to keys of the first argument object (left side argument) over the second argument object (right side argument). In case of conflict, the right side object's keys will be overwritten with the left side object's and vice versa in `mergeRight`.

## mergeLeft

Let's see what `mergeLeft` does.

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

const newOrder = R.mergeLeft({ name: "ORD2" }, order);
console.log(newOrder);

/*
{
  id: 1,
  name: "ORD2", //name updated
  quantity: 10,
  customer: {
    name: "John",
    address: {
      city: "Miami",
      pin: 111111,
    }
  }
}
*/
```
As you can see in the above example, the properties of the `order` object were overwritten by the left value, that is `{ name: "ORD2" }`.

```js
const updatedCustomer = {
  customer: {
    firstName: "Oliver",
    lastName: "Smith",
  }
};

const updatedCustomerOrder = R.mergeLeft(updatedCustomer, order);
console.log(updatedCustomerOrder);
/*
{
  id: 1,
  name: "ORD1",
  quantity: 10,
  customer: { //customer object overwritten
    firstName: "Oliver",
    lastName: "Smith",
  }
}
*/
```
To understand what happens when we say overwrites, see the `updatedCustomerOrder` object. the value of the `customer` attribute was completely overwritten instead of `firstName` and `lastName` being appended to the existing attributes. So, essentially the following happened under the hood:

```js
const updatedCustomerOrder = { ...order, ...updatedCustomer };
```

## mergeRight

Let's see how `mergeRight` is different from `mergeLeft`.

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

const tmpOrder = {
  name: "ORD2",
  customer: {
    firstName: "John",
    lastName: "Smith",
  }
};

const newOrder = mergeRight(order, tmpOrder);
console.log(newOrder);
/*
{
  id: 1, //id wasn't changed
  name: "ORD2", // name updated
  quantity: 10, //quantity wasn't changed
  customer: { // customer object overwritten
    firstName: "John",
    lastName: "Smith"
  }
}
*/
```

As you can see in the above example, `order`'s properties were overwritten by the right value, i.e `tmpOrder`'s properties. The `name` and `customer` properties also got overwritten.

In this case, the following happened:
```js
const newOrder = { ...order, ...tmpOrder };
```
