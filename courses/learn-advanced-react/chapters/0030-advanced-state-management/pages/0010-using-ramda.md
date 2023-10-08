Unlike other excellent libraries with a functional flavor such as Underscore and Lo-Dash, Ramda is a library designed specifically for a functional programming style, making it easy to create functional pipelines and never mutate the user data. This makes it perfect for state management.

Rather than learning all the Ramda functions, we recommend starting with the functions that have been mentioned in this chapter. They are what we consider the essentials for state management. Learn the other methods as you find the need for them.

Here's a simple example using the Ramda `remove` function:

```jsx
arr = [1,2,3,4,5]
remove(1,2,arr) // [1,4,5]
arr // [1,2,3,4,5]
```

In the example above, using Ramda's `remove` function does not mutate the variable `arr` which is exactly the behavior we're looking for when handling states.

[The Ramda docs](https://ramdajs.com/docs/) are essential for reference.

[The Ramda repl](https://ramdajs.com/repl/) is great to try out the Ramda functions while learning.

It is important to understand the concept of Currying before using Ramda.

## Currying

Currying is a transformation of functions that translates a function callable as `f(a, b, c)` into callable as `f(a)(b)(c)`. Currying doesn’t call a function. It just transforms it.

For those interested, this is the same currying used in Ramda's namesake: Lambda calculus.

Let's take the same example we saw before to understand currying:

```js
arr = [1,2,3,4,5]
const func = remove(1,2) // returns a curried function.
```

Now we could pass in any array to `func` and curry it to `remove(1,2)`, like this:

```js
func(arr) // returns [3,4,5].
remove(1,2)(arr) // same result as before
remove(1)(2)(arr) // same result as before
remove(1, 2, arr) // same result as before
```

All the ways to call the `remove` function above are equivalent.

## Commonly used functions with React

Trying to learn and use the entire set of methods provided by Ramda is a massive overhead and possibly very redundant. Thus we will only be advocating the use of the following methods on a day-to-day basis.

For all of the following method's explanations we will be using the following data variable as reference:

```js
const ORDER = {
  id: 1,
  name: "ORDER1",
  quantity: 10,
  customer: {
    name: "John",
    address: {
      city: "Miami",
      pin: 123456,
    }
  }
};
```

### assoc

Updates a single property in an object with a static value. Has the syntax: `assoc(propertyName, propertyValue, object)`

Here are a couple of simple examples of `assoc` in use:

```js
assoc('completed', true, ORDER);
// {
//   id: 1,
//   completed: true,
//   name: "ORDER1",
//   quantity: 10,
//   customer: { ... }
// };

assoc('id', 3, ORDER);
// {
//   id: 3,
//   name: "ORDER1",
//   quantity: 10,
//   customer: { ... }
// };
```

It makes a shallow clone of an object, setting or overriding the specified property with the given value. Note that this copies and flattens prototype properties onto the new object as well. All non-primitive properties are copied by reference.

This is perfect for modifying a flat object state with a new property. Rather than setting the code like:
`setUser(prevUser => {...prevUser, firstName: "Oliver"})`

You can instead set the code like `setUser(assoc("firstName", "Oliver"))`. The function `assoc("firstName", "Oliver")` returns a function that curries the `prevUser` as the 3rd parameter.

### assocPath

This is a nested version of assoc with the syntax `assocPath(pathArray, propertyValue, object)`

Here's an example of `assocPath` in use:

```js
assocPath(["customer", "address", "pin"], 654321, ORDER);
// {
//   id: 1,
//   name: "ORDER1",
//   quantity: 10,
//   customer: {
//     name: "John",
//     address: {
//       city: "Miami",
//       pin: 654321,
//     }
//   }
// }
```

Makes a shallow clone of an object, setting or overriding the nodes required to create the given path, and placing the specific value at the tail end of that path. Note that this copies and flattens prototype properties onto the new object as well. All non-primitive properties are copied by reference.

This is especially useful when modifying deeply nested states. If you wished to change the value of `user.address.contact.email` in the reference variable `ORDER`, the vanilla ES6 way would be:

```js
setUser(prevUser => {
  const newUser = {
    ...prevUser,
    address: {
      ...prevUser.address,
      contact: {
        ...prevUser.address.contact,
        email: e.target.value
      }
    }
  };
  return newUser;
});
```

The code shown above is messy, long and downright unreadable with larger or more deeply nested states. The same update done using Ramda's assocPath method looks like this:

```js
setUser(assocPath(["address","contact","email"], e.target.value))
```

The method `assocPath(["address","contact","email"], e.target.value)` creates a function that curries the 3rd parameter

### mergeLeft/mergeRight

While the assoc methods are great for setting single values, the `mergeLeft` and `mergeRight` methods allow us to "merge" two objects as the name suggests.

Both of them create a new object with the properties of the first object merged with the properties of the second object. The difference between the two is: if a key exists in both objects, `mergeLeft` keeps the value from the first object while `mergeRight` keeps the value from the second object.

For example, here's the effect of a `mergeLeft` on the `ORDER` constant:

```js
const tmpOrder = {
  name: "ORDER2",
  completed: true
}
mergeLeft(newValues, ORDER);
/*
{
  id: 1,
  name: "ORDER2",  //Changed to "ORDER2"
  completed: true, //Added attribute to ORDER
  quantity: 10,
  customer: {
    name: "John",
    address: {
      city: "Miami",
      pin: 123456,
    }
  }
}
*/
```

As shown above, the newly created object is a merger of `tmpOrder` and `ORDER`. However, the value `name` exists in both objects and thus was selected from the `tmpOrder` object.

It is equivalent to:

```js
{
  ...ORDER,
  ...tmpOrder,
}
```

Here's the effect of a `mergeRight` on the `ORDER` constant with the same `tmpOrder` on the left:

```js
const tmpOrder = {
  name: "ORDER2",
  completed: true
}
mergeRight(tmpOrder, ORDER);
/*
{
  id: 1,
  name: "ORDER1",  //Maintained value of "ORDER1"
  completed: true, //Added attribute to ORDER
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

As shown above, the newly created object is a merger of `tmpOrder` and `ORDER`. However, the value `name` exists in both objects and thus was selected from the `ORDER` object on the right.

It is equivalent to:

```js
{
  ...tmpOrder,
  ...ORDER,
}
```

### mergeDeepLeft/mergeDeepRight

The mergeDeep methods allow you to modify rather than overwrite the nested objects as shown below:

```js
mergeDeepLeft({id: 2, customer: {name: "Oliver"}}, ORDER);
/*
{
  id: 2, //=> sets id as 2
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "Oliver",   //=> sets name as Oliver but maintains rest of "customer"
    address: {
      city: "Miami",
      pin: 111111,
    }
  }
}
*/
```

The same inputs given to the merge function would overwrite the nested objects like this:

```js
merge({id: 2, customer: {name: "Oliver"}}, ORDER);
/*
{
  id: 2, //=> sets id as 2
  name: "ORD1",
  quantity: 10,
  customer: {         //=> sets the entire "customer" to {name: "Oliver"}
    name: "Oliver"
  }
}
*/
```

`mergeDeepRight` is the equivalent of `mergeRight` compared to `mergeLeft`.

### modify

While the `assoc` and `merge` methods set a piece of data, the `modify` method updates a piece of data by applying a function to it as shown below:

```js
modify('id', x => x+1, ORDER);
modify('id', add(1), ORDER); //Same as above but using an add function from Ramda
// {
//   id: 3, => The previous id of 2 got added by 1 to 3
//   name: "ORDER1",
//   quantity: 10,
//   customer: { ... }
// };
```

The function will not be invoked, and the object will not change if its corresponding property does not exist in the object.

All non-primitive properties are copied to the new object by reference.

`modifyPath` is equivalent to `assocPath` compared to `assoc`

### clone

If you wish to manually copy an object along with all its nested sub-objects, the `clone` method can be of great help.

Cloning the `ORDER` constant using vanilla ES6 would look like this:

```jsx
const orderCopy = {
  ...ORDER,
  customer: {
    ...ORDER.customer,
    address: {
      ...ORDER.customer.address
    }
  }
}
```

The same using the Ramda clone method looks like:

```jsx
const orderCopy = clone(ORDER)

ORDER === orderCopy //=> false, since y is a completely new object from x
equals(ORDER, orderCopy) //=> true, a Ramda function that compares values of objects
```
