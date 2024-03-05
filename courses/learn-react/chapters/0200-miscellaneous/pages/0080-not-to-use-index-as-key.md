We have already discussed the importance of using key prop while rendering a list of items in [Keys in mapping](https://courses.bigbinaryacademy.com/learn-react/rendering-data-arrays/keys-in-mapping) lesson. However, a common mistake is using the index of the item as the `key`. While this may seem like a reasonable solution, it can cause issues when the order of the list items changes. When the order of the list items changes, React may not be able to correctly identify which items have changed, resulting in unnecessary DOM updates and potentially slowing down your application.

Let's take a look into this problem with the help of an example. In the code given below, we are rendering a list of input fields with corresponding delete buttons that have an index as key.

<codeblock language="reactjs" packages="tailwindcss" type="lesson">
<code>
import React, { useState } from "react";

const App = () => {
  const [students, setStudents] = useState(["Ann", "Eve", "Joe"]);

  return (
    <div>
      {students.map((student, index) => {
        return (
          <div className="m-10" key={index}>
            {student}
            <input className="border" />
            <button
              className="rounded-sm bg-gray-400 p-1"
              onClick={() => {
                setStudents(names => names.filter(name => name !== student));
              }}
            >
              X
            </button>
          </div>
        );
      })}
    </div>
  );
};
export default App;
</code>
</codeblock>

Now, add some values to the input elements and try deleting an element from the beginning or middle :

<image>passing-index-as-key.gif</image>

You may have noticed that, when removing an item from the beginning or middle of a list, the last item gets removed instead of the intended item. What happens here is that, when you remove an item from the list, all the internal states that were attached to that item's key get transferred to the next item in the list. React uses the key to associate these internal states. Here `input` has an internal state.
For example, if you remove `Ann` from the list, the internal states attached to `Ann` will now be available to `Eve`, and the internal states attached to `Eve` will now be available to `Joe`, and so on. This results in the internal state of the `Joe` item getting lost.

To resolve this problem, it's essential to use a stable identifier for each item in the list as the key, ensuring that React can accurately track the identity of the items even after deletions or reordering.

### Performance issue of passing index as `key`

Consider a scenario where we have a list of items, with a `key` attribute as index.

```html
<ul>
  <li key="1">Apple</li>
  <li key="2">Orange</li>
  <li key="3">Grape</li>
</ul>
```

Now, in case any state change occurs within this list, React compares the virtual DOM with a virtual DOM snapshot, looks for changes, and finally updates the RealDOM with only those changes.

If we add an item to the end of the list, React no longer needs to mutate the DOM nodes corresponding to the first 3 list items. It will just add a new list item at the end.

```html
<ul>
  <li key="1">Apple</li>
  <li key="2">Orange</li>
  <li key="3">Grape</li>
  <li key="4">Banana</li>
</ul>
```

But suppose we add the new item at the beginning of the list.

```html
<ul>
  <li key="1">Banana</li>
  <li key="2">Apple</li>
  <li key="3">Orange</li>
  <li key="4">Grape</li>
</ul>
```

Now, the key of the remaining list items also changes, which makes React to mutate every item in the DOM, instead of just adding a new item at the beginning.

This can be avoided if we use some unique ID as a `key` instead of index.

Let's again consider the same example, but this time by using a unique id as the `key`.

```html
<ul>
  <li key="12abc">Apple</li>
  <li key="23bcd">Orange</li>
  <li key="34cde">Grape</li>
</ul>
```

Now even if we add an item to the beginning or the end, we won't face an issue since keys are different. Since React tracks all list items with their `key` attribute, after adding a new item it would not mutate the previous items in the DOM.

Let's look at one more example of these two approaches.

In the below example, the first list is created using `index` as `key` and in the second using `id` as `key`.

<codeblock language="reactjs" packages="tailwindcss" type="lesson">
<code>
import React, { useState } from "react";

const App = () => {
  const numbers = [
    { id: 1, value: "1" },
    { id: 2, value: "2" },
    { id: 3, value: "3" },
    { id: 4, value: "4" },
    { id: 5, value: "5" },
    { id: 6, value: "6" },
    { id: 7, value: "7" },
    { id: 8, value: "8" },
    { id: 9, value: "9" },
    { id: 10, value: "10" },
  ];
  const [numbersListOne, setNumbersListOne] = useState(numbers);
  const [numbersListTwo, setNumbersListTwo] = useState(numbers);

  const getFilteredList = (numbers, id) =>
    numbers.filter(item => item.id !== id);

  return (
    <div>
      <h3>Using Key as index</h3>
      <ul>
        {numbersListOne.map(({ id, value }, index) => {
          return (
            <li
              className="flex justify-between border border-black p-1"
              key={index}
            >
              {value}
              <button
                className="rounded-sm bg-gray-500 p-1"
                onClick={() => {
                  setNumbersListOne(numbers => getFilteredList(numbers, id));
                }}
              >
                X
              </button>
            </li>
          );
        })}
      </ul>
      <h3>Using Key as id</h3>
      <ul>
        {numbersListTwo.map(({ id, value }) => {
          return (
            <li
              className="flex justify-between border border-black p-1"
              key={id}
            >
              {value}
              <button
                className="rounded-sm bg-gray-500 p-1"
                onClick={() => {
                  setNumbersListTwo(numbers => getFilteredList(numbers, id));
                }}
              >
                X
              </button>
            </li>
          );
        })}
      </ul>
    </div>
  );
};

export default App;
</code>
</codeblock>

When removing an item from the first list, the entire child node is updated, whereas in the second list, only the targeted item is removed while the original list remains intact.

<image>passing-id-as-key.gif</image>
