RamdaJS(abbreviated as `Ramda`) is a library designed specifically for a functional programming style, one that makes it easy to create functional pipelines, and one that never mutates user data. The functional nature of this library makes it easily reusable and helps in keeping the code DRY.

## A note to the reader

Keep the [Ramda docs](https://ramdajs.com/docs/) for reference and please use the [Ramda repl](https://ramdajs.com/repl/) to try out the Ramda functions while learning. Try not to learn all the Ramda functions by heart. Rather learn only the functions which has been mentioned in this chapter. This is to make sure that you learn the essentials but not overburden yourself.

PS: All functions mentioned in this chapter, like say `remove` etc, are imported from `ramda`.

## Data is never mutated

Look at the following example:

```js
arr = [1,2,3,4,5]
remove(1,2,arr) // [1,4,5]
arr // [1,2,3,4,5]
```

So as you can see in the above example we are not actually mutating the array but rather we are just using the particular data in order to return a new array with certain elements removed from original array. `remove` just removes the sub-list of `list` starting at index `start` and containing `count` elements. 

## Currying

Most of the Ramda functions follows a similar function signature in which we pass the properties as the first set of arguments and then we pass towards the end the actual data that we want to manipulate. This is to ensure that we will be able to curry the particular data

Currying is a transformation of functions that translates a function from callable as `f(a, b, c)` into callable as `f(a)(b)(c)`. Currying doesn’t call a function. It just transforms it.

The simple principle of curried function is that, the operations will be passed first as args and the data is always passed towards the end of the argument list.

Lets take the same example we saw before to understand currying:

```js
arr = [1,2,3,4,5]
const func = remove(1,2) // returns a curried function.
```

Now we could pass in any array to `func` and curry it to `remove(1,2)`, like so:

```js
func(arr) // returns [3,4,5].
remove(1,2)(arr) // same result as before
remove(1)(2)(arr) // same result as before
remove(1, 2, arr) // same result as before
```

## Useful methods

Trying to learn and use the full set of methods provided by Ramda will be a big overhead and too much time consuming. Thus we will only be advocating to make use of the following cherry-picked methods on a day to day basis.

For all of the following method's explanations we will be using the following data variable:

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
```

### assoc

> TL;DR: Update a single property in an object using a static value.

Makes a shallow clone of an object, setting or overriding the specified property with the given value. Note that this copies and flattens prototype properties onto the new object as well. All non-primitive properties are copied by reference.

```js
assoc('c', 3, {a: 1, b: 2}); //=> {a: 1, b: 2, c: 3}
assoc('b', 3, {a: 1, b: 2}); //=> {a: 1, b: 3}
```

### assocPath

> TL;DR: Acts very similar to `assoc`. But this method can also be applied on nested objects too.

Makes a shallow clone of an object, setting or overriding the nodes required to create the given path, and placing the specific value at the tail end of that path. Note that this copies and flattens prototype properties onto the new object as well. All non-primitive properties are copied by reference.

```js
assocPath(["customer", "address", "pin"], 123456, order);
/*
{
  id: 1,
  name: "ORD1",
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

### mergeLeft/mergeRight

> TL;DR: `assoc` methods cannot update multiple properties at a time. `merge` methods can update multiple properties with a single statement.

The important difference between `mergeLeft` and `mergeRight` is which part will be overwritten. Another simpler way to think about this is which side will be kept intact during merging, that is, in `mergeLeft` it will be `left` argument and in `mergeRight` it will be `right` argument.

Let's see what `mergeLeft` does:

```js
mergeLeft({name: "ORD2"}, order);
/*
{
  id: 1,
  name: "ORD2",
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

So as you can see in the above example, the properties of `order` was overwritten by the left value, that is `{name: "ORD2"}`.

Let's see how `mergeRight` is different:

```js
const tmpOrder = {
  id: 2,
  name: "ORD2",
  quantity: 10,
  customer: {
    firstName: "John",
    lastName: "Smith",
  }
};

mergeRight(tmpOrder, order);
/*
{
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
}
*/
```

So as you can see in the above example, the properties of `tmpOrder` was overwritten by the right value, that is of `order`.

Apart from `id`, `name` properties, the non-primitive `customer` property also got overwritten. Like it was mentioned at the start, `mergeRight`, "overwrites" the first `object` with the second one. So essentially the following happened underneath the hood:

```js
{
  ...tmpOrder,
  ...order,
}
```

So the `customer` key of `tmpOrder` got fully overwritten by the `customer` key of `order`.

### mergeDeepLeft/mergeDeepRight

> TL;DR: Acts very similar to `mergeLeft/Right`. But this method can also merge nested objects too without overwriting them.

If we want to "override" instead of "overwriting" the nested objects, then we can use these `Deep` methods.

```js
mergeDeepLeft({id: 2, customer: {name: "Oliver"}}, order);
/*
{
  id: 2, //=> sets id as 2
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "Oliver", //=> sets name as Oliver
    address: {
      city: "Miami",
      pin: 111111,
    }
  }
}
*/
```

So as you can see, the `customer` key of `order` didn't get fully overwritten, but rather the specific keys got overridden. Meaning the key `customer.name` from `order` got overridden by the `customer.name = "Oliver"` from the left argument and rest of the properties from order were retained as it was.

Let's take an example for `mergeDeepRight`, where the nested object of the left argument has a property that the right object doesn't have:

```js
mergeDeepRight({id: 2, customer: {name: "Oliver", isAdmin: true}}, order);
/*
{
  id: 1, //=> id updated from 2 to 1
  name: "ORD1"
  quantity: 10,
  customer: {
    isAdmin: true, //=> a property that order doesn't have
    name: "John", //=> replaced Oliver with John from order
    address: {
      city: "Miami",
      pin: 111111
    },
  },
}
*/
```

As you can see the key `isAdmin` also got retained after the merge, because we didn't `overwrite` the `customer` key.

### Preferring left vs right

Another question that might arise is, when to prefer `left` and when to prefer `right`. So since the Ramda functions are curried by default and since data is always the last argument, we can make the judgement based on these two factors. We can prefer to use `left`, if the value of the object that ought to be kept intact is known beforehand itself.

A real world case for preferring `left` would be when we have to make sure a particular set of values as always assigned to certain properties. Example:

```js
// We want to ensure every order object will have details of the current user.
const USER_DETAILS = {
  user: currentUser,
  deliveryAddress: currentUser.address
};

// main code
const { orders } = await ordersApi.fetch();
return orders.map(mergeLeft(USER_DETAILS));
```

A real world case for preferring `right` would be when we have to set default values to certain properties, if they already don't have a value set. Example:

```js
const ORDER_DEFAULTS = {
  orderDispatched: false,
  shippingMode: "free"
};

// main code
const { orders } = await ordersApi.fetch();
return orders.map(mergeRight(ORDER_DEFAULTS));

/*
const order = [{
  name: "ORD1",
}];

output: [{"name": "ORD1", "orderDispatched": false, "shippingMode": "free"}]
*/
```

### modify

> TL;DR: The `assoc` and `merge` methods can only set an external value to the data. If we want to update the data referring to its own values, then we can use `modify`.

Creates a copy of the passed object by applying an fn function to the given prop property.

The function will not be invoked, and the object will not change if its corresponding property does not exist in the object. All non-primitive properties are copied to the new object by reference.

```js
const person = {name: 'James', age: 20, pets: ['dog', 'cat']};
modify('age', previousAge => previousAge + 1,, person); //=> {name: 'James', age: 21, pets: ['dog', 'cat']}

// the above statement can be written using a ramda helper like so:
modify('age', add(1), person); //=> {name: 'James', age: 21, pets: ['dog', 'cat']}

modify('pets', append('turtle'), person); //=> {name: 'James', age: 20, pets: ['dog', 'cat', 'turtle']}

// another example in React that increments quantity by 1
setOrder(prevOrder =>
  modify("quantity", prevDuration => prevDuration + 1, prevOrder)
);
// Result same as above statement, but more cleaner
setOrder(prevOrder =>
  modify("quantity", inc, prevOrder) // inc method is from Ramda
);
// the above statement can be written in a curried manner like so:
setOrder(modify("quantity", inc)); // prevOrder will get passed to the curried "modify" method implicitly
/*
{
  id: 1,
  name: "ORD1",
  quantity: 11,
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

### modifyPath

> TL;DR: The `modifyPath` method is similar to what `assocPath` is to `assoc`. Use it when we have to modify a nested property.

Creates a shallow clone of the passed object by applying an fn function to the value at the given path.

```js
modifyPath(["customer", "address", "pin"], inc, order); // inc method is from Ramda
/*
{
  id: 1,
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "John",
    address: {
      city: "Miami",
      pin: 111112, //=> inc by 1
    }
  }
}
*/
```

### evolve

> TL;DR: When we have to modify multiple properties in one go, then we can prefer to use `evolve`. It is to `modify` like how `mergeDeep` methods are to `assoc`.

Creates a new object by recursively evolving a shallow copy of object, according to the transformation functions. All non-primitive properties are copied by reference.

A transformation function will not be invoked if its corresponding key does not exist in the evolved object.

Example:

```js
evolve(
  {
    quantity: inc,
    customer: {
      name: () => "Oliver",
      someNewKey: always("new"),
      address: { city: concat(__, " City") },
    },
  },
  order
);
/*
{
  id: 1,
  name: "ORD1",
  quantity: 11, //=> inc by 1
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

Let's break down the above statement:
- `evolve` is like `mergeDeepLeft`.

- `evolve` only accepts functions as values. That is why we have passed `() => "Oliver"` for the `customer.name` property. We could also use the `always` method from Ramda, like `always("Oliver")`, that does exactly the same thing.

- In the result, we don't see the property `someNewKey` because `evolve` can't add new properties to the object. It can only evolve existing properties into something else.

- We wanted to suffix all city names with `City` keyword. But if we write it just like `concat(" City")`, then that keyword will get prefixed because the data value, that is `customer.address.city`, will be passed as last argument, and we will end up with `CityMiami`. In cases like these, where we want to change the order to the curried arguments, we can use "gap" operator denoted by two underscores. It's a special placeholder value used to specify "gaps" within curried functions, allowing partial application of any combination of arguments, regardless of their positions. So essentially the gaps will be filled by the curried values. Thus `concat(__, " City")` will generate `Miami City`.<br /><br />

### pipe/compose

`pipe`, just like the UNIX pipe operator, will pass the result from one function to another, in a left to right order.

Example:

```js
const positiveCalc = pipe(Math.abs, add(2), multiply(2), subtract(__, 2));
positiveCalc(2); //=> 6
```

So `pipe`, starts by passing the curried argument to `Math.abs`, and then the result to `add(2)` and then the result of `add(2)` is passed to `multiply(2)` and from there to `subtract`. Notice once again that we have used the gap operator in `subtract` method. If we don't use it, then our output will be negative.

The `compose` method works exactly in the same way `pipe` works, but the order of execution of arguments is right to left.

### fromPairs/toPairs

- `fromPairs`: Creates a new object from a list of key-value pairs. If a key appears in multiple pairs, then the rightmost pair is included in the object.
- `toPairs`: Converts an object into an array of key, value arrays.

```js
const pairs = toPairs({a: 1, b: 2, c: 3}); //=> [['a', 1], ['b', 2], ['c', 3]]
fromPairs(pairs); //=> {a: 1, b: 2, c: 3}

// real world use case
const capitalCaseAllKeys = pipe(
  toPairs,
  map(([k,v]) => [toUpper(k), v]), //=> toUpper and map is from ramda
  fromPairs
);
capitalCaseAllKeys({a:1, b:1}); //=> {"A": 1, "B": 1}
```

### equals

> TL;DR: For deep equality checks of objects, similar to JSON.stringify equality checks.

Before jumping in and using this method, let's first understand the basics of equality operators in JavaScript:

```js
const x = {a:1}
const y = {a:1}

x == y //=> false because both are different references with type conversion
x === y //=> false because both are different references without type conversion

const z = x;
z === x; //=> true because same reference
z === y; //=> false
```

So as you can see comparison of non-primitive values is based on their references and thus can be tricky in JavaScript. In order
to overcome this issue, we can use the `equals` method from Ramda which does deep comparison:

```js
const x = {a:1, b: { c: 1 }}
const y = {a:1, b: { c: 1 }}
equals(x,y) //=> true
const z = {a:1, b: { c: 2 }}
equals(z,y) //=> false
```

### clone

> TL;DR: For deep cloning a nested object.

Cloning is pretty straightforward. Let's see an example:

```js
const x = {a:1, b: { c: 1 }}
const y = clone(x); //=> much simpler than writing {...x, b: { ...x.b }}

x === y //=> false, y is a completely new object
equals(x,y) //=> true
```

### Honorable mentions

- `keys(object)`: Returns a list containing the names of all the enumerable own properties of the supplied object.
- `values(object)`: Returns a list of all the enumerable own properties of the supplied object.
- `pluck(propertyName, objectArray)`: Returns a new list by plucking the same-named property off all objects in the list supplied.<br /><br />

## State updates in React

Currying comes in handy during state updates in React. Let's see what's the pain point and how it can be solved using RamdaJs.

Example use case of `assoc`:

```js
// longer version
setUser(prevUser => {...prevUser, firstName: "Oliver"})

// ramda version of above code
setUser(assoc("firstName", "Oliver")) //=> curries prevUser as 3rd param
```

We often see developers updating state like so:

```js
// error prone version of state update
setUser(prevUser => {
  const newUser = {...prevUser};
  newUser.address.contact.email = e.target.value;
  return newUser;
});
```

The above version of the code has several problems:
- Logic fails when applying React optimization techniques like `React.memo` and passing say `newUser.address` as argument to it. The reference of the non-primitive `address` hasn't changed, but only the `email` value was changed. Thus from the perspective of `memo` it's the same reference and thus won't re-render. But our expectation is for the component to re-render.
- The code will get messy when updating a deeply nested property.

Another variation of an error prone state update is shown below:

```js
const [user, setUser] = useState({});

// error prone version of state update
setUser(prevUser => {
  const newUser = prevUser;
  newUser.address.contact.email = e.target.value;
  return newUser;
});
```

In the above example, React won't even re-render the current component, because `user` state's value, which is a reference to an object, hasn't been changed. That's because `const newUser = prevUser` is essentially making `newUser` point to the same memory location as `prevUser`. Thus both refer same memory location and reference doesn't change. So from the perspective of React's state update logic, data hasn't changed, and thus it wouldn't re-render.

The vanilla ES6 way of fixing this issue is by destructuring the code like so:

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

Although the above code would work, it's very messy and long. And more than that if we are updating a much more deeply nested property, then the code would become unreadable.

We can make this better by using `assocPath`, like so:

```js
// ramda version of above code
setUser(assocPath(["address","contact","email"], e.target.value)) //=> curries prevUser as 3rd param
```

## Don't over use Ramda

Just because we are using RamdaJS, doesn't mean we should over exploit its usage and make the code more complex.

Let's take an example. Say that we want to transform the following data we get from a 3rd party API:

```js
const githubChecklist = {
	'feature1-frontend': true,
	'feature1-backend': false,
	'feature2-frontend': false,
	'feature2-backend': true,
	'raise_pr': true,
	'ask_for_review': false,
	'merge_pr': true
};
```

into the following structure which can be used to display the `ToDo` checklist items in our website:

```json
{
  "feature1":[
    { "checked":true, "label":"frontend" },
    { "checked":false, "label":"backend" },
    "..."
  ],
  "feature2":[
    { "checked":false, "label":"frontend" },
    { "checked":true, "label":"backend" },
    "..."
  ],
  "general":[
    { "checked":true, "label":"raise_pr" },
    { "checked":false, "label":"ask_for_review" },
    { "checked":true, "label":"merge_pr" },
    "..."
  ]
}
```

This can be elegantly solved using vanilla ES6 JavaScript itself like so:

```js
const buildChecklist = todos => {
  const reducer = (checkList, [todo, checked]) => {
    const parts = todo.split("-");
    const [group, label] = parts.length > 1 ? parts : ["general", parts[0]];
    const currentItems = checkList[group] || [];
    return { ...checkList, ...{[group]: currentItems.concat({ label, checked }) }}
  };

  return Object.entries(todos).reduce(reducer, {});
}
```

One might get tempted to use Ramda and try to solve this issue using the same. But there are few points to think about before making that choice:

- Will porting the current code to Ramda make it more readable or will it make it more complex to read?

- Will we be reusing this function with varied argument list in future? Can the core functionality change?

- If the vanilla JS code naturally occurred in your mind to solve this issue, then should you be forcing yourself to use Ramda over here just for the sake of using it?

At the moment, the vanilla JS code is clean and on point, and thus is very readable. More than that, we don't know whether this function will be used more than once or even whether its function signature will change or not. Let's worry about that in the "future"!

Afterall, it's all about the Return of Investment(ROI). Currently trying to make `buildChecklist` a curried function using Ramda is not worth it.

It's like the case with using REGEX. Even if there are builtin methods taking care of pattern matching, inclusion checking etc, some folks tend to use REGEX because it's "cool" and since it solves the problem at hand. But now they've got two "problems" at hand!

Let's look at one more example to prove the point. Please spend some time looking at both versions shown in below code and try to make a judgement on which one is more complex looking and which one is more elegant:

```js
// ramda version
filteredProjects = filter(
  compose(flip(includes)(selectedIds), prop("id")),
  projects
);

// vanilla JS version
filteredProjects = projects.filter(({ id }) => selectedIds.includes(id));
```

As any sane mind would've figured, the vanilla JS version is much more cleaner and elegant than the Ramda version. Being cleaner also in turn means that it's more easily readable!

## Lens and over methods

Lenses are very advanced Ramda concepts and thus might take some time to get used to. We don't usually recommend using lenses. But if a valid use case occurs, we should be able to use it. The following two are good references to get an idea about how lenses work:

- https://medium.com/javascript-inside/an-introduction-into-lenses-in-javascript-e494948d1ea5

- https://egghead.io/lessons/react-update-component-state-in-react-with-ramda-lenses
