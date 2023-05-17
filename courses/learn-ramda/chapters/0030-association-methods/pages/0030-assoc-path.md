`assocPath` works the same way as `assoc`. It is used when we want to update the properties of a deeply nested object. Let's understand the use of `assoc` through the case of state updates on the deeply nested `order` object.

```js
const sampleOrder = {
  id: 1,
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "John",
    address: {
      id: 23,
      city: "Miami",
      pin: 111111,
      contact: {
        email: "john@example.com"
      }
    }
  }
};

const [order, setOrder] = useState(sampleOrder);

// error prone version of state update
setOrder(prevOrder => {
  const newOrder = prevOrder;
  newOrder.customer.address.id = e.target.value;
  return newOrder;
});
```

In the above example, React won't even re-render the current component, because the `order` object's value, which is a reference to an object, hasn't been changed. That's because `const newOrder = prevOrder` is essentially making `newOrder` point to the same memory location as `prevOrder`. Thus both refer to the same memory location and the reference doesn't change. So from the perspective of React's state update logic, data hasn't changed, and thus it wouldn't re-render.

To fix this, we would try to create a new object with object destructuring as follows:
```js
setOrder(prevOrder => {
  const newOrder = {...prevOrder};
  newOrder.customer.address.id = e.target.value;
  return newOrder;
});
```

Here `newOrder` is a new shallow copy of `order`. So it would work fine for React state updates.

But still, there are some other problems with this approach. The child object `order.customer` is a non-primitive data type. When applying the spread operator on `order`, only the reference of `order.customer` is copied to `newOrder`.

So, the logic would fail when passing the child object `order.customer` as a dependency to hooks like `useMemo` or `useEffect`. When react compares items in the dependency array, `order.customer`'s reference would always be equal to the previous reference and therefore the hook won't re-run.

Consider we need to re-fetch the address when the address ID changes. We would use the `useEffect` hook and add `order.customer.address` to the dependency array.
```js
useEffect(() => {
  fetchAddress(order.customer.address.id);
}, [order.customer.address])

const handleChangeAddress = e => {
  setOrder(prevOrder => {
    const newOrder = {...prevOrder};
    newOrder.customer.address.id = e.target.value;
    return newOrder;
  });
}
```
The issue here is that while `order` is a new object, `order.customer.address` is copied by reference, hence when `useEffect` checks for a change in `order.customer.address`, it would have the same reference as before and thus, `useEffect` would never run.

The vanilla ES6 way of fixing this issue is by applying the spread operator on all levels as shown below:

```js
setOrder(prevOrder => {
  const newOrder = {
    ...prevOrder,
    customer: {
      ...prevOrder.customer,
      address: {
        ...prevOrder.customer.address,
        id: e.target.value
      }
    }
  };
  return newOrder;
});
```

Although the above code would work, it's very messy and long. And more than that if we are updating a much more deeply nested property, then the code would become unreadable.

The above code can be written more elegantly by using the `assocPath` function, like so:

```js
// Ramda version of above code
setOrder(assocPath(["customer", "address", "id"], e.target.value))
// prevOrder is curried as third param
```
