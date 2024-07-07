Let's see another example with the same `order` object as earlier. We want to increment the value of `quantity` by 1. How would we go about doing this?

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

// Vanilla JavaScript - modifies original object
order.quantity+=1;

// Without modifying original object
const newOrder = { ...order, quantity: order.quantity + 1 }

// Assuming order is a React state, we can update it as shown:
setOrder(prevOrder =>
  ({ ...prevOrder, quantity: prevOrder.quantity + 1 }));

/*
{
  id: 1,
  name: "ORD1",
  quantity: 11, //=> quantity incremented by 1
  customer: {
    // same as earlier
  }
}
*/
```

Here we can use the `modify` function from Ramda to update the data referring to its previous values as follows:
```js
// Clean version using modify:
modify("quantity", prevQuantity => prevQuantity + 1, order);

// inc from Ramda increments the given number which is curried:
modify("quantity", inc, order);

// For React state updates, `prevOrder` is curried as the third param:
setOrder(modify("quantity", inc))

/*
{
  id: 1,
  name: "ORD1",
  quantity: 11, //=> quantity incremented by 1
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
It can be seen how elegant we can make code by applying all the features of Ramda.

A very important point to keep in mind is that `modify` cannot be used to add a new property to an object. This makes sense from the use case of `modify`. It is used to assign a new value to a key based on its previous value. If we're adding a new key, it does not have a previous value, hence we would use `assoc` or `assocPath` for such scenarios.

Let's look at a few more examples of how we can use `modify`:

```js
const person = {
  name: "James",
  age: 20,
  pets: ["dog", "cat"],
};

modify("age", inc, person); //=> { name: "James", age: 21, pets: ["dog", "cat"] }

// the above statement can also be written using a Ramda function `add` like this:
modify("age", add(1), person); //=> { name: "James", age: 21, pets: ["dog", "cat"] }


// We can also append another value to the pets array:
modify("pets", append("turtle"), person); //=> { name: "James", age: 20, pets: ["dog", "cat", "turtle"] }

// We can add a title to the name:
modify("name", concat("Mr "), person); //=> { "name": "Mr James", "age": 20, "pets": ["dog", "cat"] }

// Adding a new property does not work:
modify("gender", prevGender => "male", person); //=> { name: "James", age: 20, pets: ["dog", "cat"] } (Fails silently, no changes introduced)
```
