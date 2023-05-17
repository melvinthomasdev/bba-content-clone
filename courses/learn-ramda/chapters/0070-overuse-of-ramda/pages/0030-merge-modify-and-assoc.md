We looked at several `merge` functions as well as `modify` and `assoc`. Let's look at cases where using them benefits us and where we should avoid and go for vanilla JS.

- In the case of `mergeDeepLeft`, `mergeDeepRight`, `assocPath`, `modifyPath`, and `evolve`, the vanilla JS alternative is to spread nested keys at each level. Since it would make the code longer, it is almost always better to use the Ramda functions for such cases.

- For `merge`, `assoc` and `modify` we can use them when we want to write point-free code. For example, while setting state in React, we can make use of these functions to avoid using a callback as the previous value is automatically curried.

  It can be seen below:
  ```js
  // assoc
  setOrder(prevOrder => ({ ...prevOrder, name: "ORD2" }));
  setOrder(assoc("name", "ORD2"));

  // mergeLeft or mergeRight
  setOrder(prevOrder => ({ ...prevOrder, user: currentUser }));
  setOrder(mergeLeft({ user: currentUser }));

  // modify
  setOrder(prevOrder => ({ ...prevOrder, quantity: prevOrder.quantity + 1 }));
  setOrder(modify("quantity", inc));
  ```

  Let us see an example outside of state updates:
  ```js
  // Vanilla JS
  const cancellableOrder = { ...order, cancellable: true };

  // Ramda
  const cancellableOrder = assoc("cancellable", true, order);
  ```

  We use Ramda to improve the readability and elegance of our code, but there is no such improvement in the above Ramda version. Since this is a one-off piece of code, we don't have much advantage in currying it either. We would provide `order` as an argument.

  So, in this scenario, we can prefer to use the JS alternative instead of `assoc`.
