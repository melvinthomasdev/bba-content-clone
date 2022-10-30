## Keys in list elements

Keys help React identify which items have changed, are added, or are removed.
Keys should be given to the elements inside the array to give the elements a
stable identity.

We usually need to render a list of data received from the backend through a
network call. Each element in the list may already have a unique ID. The best
option is to use the respective IDs of each list element as keys to identify
them uniquely like so:

```jsx
const TaskList = ({ tasks }) => {
  return (
    <>
      {tasks.map(task => (
        <li key={task.id}>{task.name}</li>
      ))}
    </>
  );
};
```

People often use the `index` as key but that should be avoided if the order of
items in the list can change. It can negatively impact the performance and also
cause issues with component state update. If you do not mention a key explicitly
then React will use the index as a key.

## Don't use the index as a key

React uses this `key` to keep track of the changes. If we use the `index` as a key value we will be facing performance issues because of unnecessary re-renders. There can also be cases where UI gets inconsistent because of using the index as a key.

Let's understand this with an example.

Let's say we have a list of fruits and we have used `index` as their key, like so:

```jsx
<div key={0}>Apple</div>
<div key={1}>Banana</div>
```

Now we want to add an item at the end of this list, say `Mango`. The updated list will be like so:

```jsx
<div key={0}>Apple</div>
<div key={1}>Banana</div>
<div key={2}>Mango</div>
```

With this addition, React will check for the changes. React will see that items with keys `0` and `1` are the same, meaning the `key` values of these list items haven't been updated. Thus React will add the third item in the UI and the rest of the items remain untouched.

Now we want to add an item at the start of the list, like so:

```jsx
<div key={0}>Watermelon</div>
<div key={1}>Apple</div>
<div key={2}>Banana</div>
<div key={3}>Mango</div>
```

With this update, all the `indexes` are changed and thus the keys of all the list items too will change. When React checks for changes it will see that all items with respect to their key's value are updated. This will cause React to re-render the whole list even though from our perspective we only added one new item into the list.

We can avoid these types of re-renders using some unique `id` in the key, like so:

```jsx
<div key="WA12">Watermelon</div>
<div key="AP34">Apple</div>
<div key="BA56">Banana</div>
<div key="MA78">Mango</div>
```

We can also use names as the key if they have unique values. In case the items in the list do not have a unique key or value, we can use a library like
[`uuid`](https://www.npmjs.com/package/uuid) to generate unique IDs and use them
as keys.

## Keyed Fragments

The `<>` is the shorthand for `<React.Fragment>`. It allows us to group a list of elements without wrapping them inside a new node. The difference between `<>` and `<React.Fragment>` is that the shorthand version does not support the `key` attribute.

So if we are using the shorthand notation of React fragment that is `<>` inside a `map` function then it will throw us a warning as no `key` is assigned inside `<>` tag. Thus, inside a `map` function rather than using the shorthand notation `<>` we should use `<React.fragment>` so that a key can be assigned to each fragment.

For example:

```jsx
//Wrong Way
items.map(item => (
  <>
    <div>{item.name}</div>
    <div>{item.phone}</div>
    <div>{item.email}</div>
  </>
));

//Correct Way
items.map(item => (
  <React.Fragment key={item.id}>
    <div>{item.name}</div>
    <div>{item.phone}</div>
    <div>{item.email}</div>
  </React.Fragment>
));
```

## Resources

- To understand why keys are necessary, you can refer to the
  [official documentation](https://reactjs.org/docs/reconciliation.html#recursing-on-children)
  of React.

- Take a look at
  [this article](https://robinpokorny.medium.com/index-as-a-key-is-an-anti-pattern-e0349aece318)
  to understand the negative impacts of using index as a key.
