Once a variable is assigned a value of a certain type, avoid assigning the
variable another value of a different type later in the code. This makes the
code harder to maintain. Let's take a look at why with the following example.

```jsx
const [tasks, setTasks] = useState(false);

const loadTasksData = async () => {
  try {
    // Retrieves an array of tasks from the backend
    const data = await fetchTasks();
    setTasks(data);
  } catch (err) {
    console.error(err);
  }
};

useEffect(() => {
  loadTasksData();
}, []);

if (!tasks) {
  return <h1>Empty</h1>;
}

return <h1>Recent: {tasks[0].content}</h1>;
```

The following sections will discuss how dynamically changing the data type of
`tasks` in the above example can make it hard to maintain the same.

## Typecasting an empty array to boolean

In JavaScript, empty arrays and empty objects are truthy. But empty strings,
`null`, `undefined`, etc., are falsy.

```jsx
console.log(Boolean([])); // true
console.log(Boolean({})); // true
console.log(Boolean('')); // false
```

In the example, the data type of `tasks` is initially `Boolean`. It's then later
changed to `Array` data type given that it's used to store the result of the API
response. Let's say, `await fetchTasks()` returns an empty array. In that case,
`!tasks` will result to `false`, thus skipping the conditional statement, and
the code will throw an error at `tasks[0].content`.

## Checking whether array is empty

In the example, we could fix the code by adding `&& tasks.length !== 0` to the
condition, like so:

```jsx
if (!tasks || tasks.length === 0) {
  return <h1>Empty</h1>;
}
```

However, this makes the code more complicated since such conditions would have
to be added in other places where `tasks` is being used as well.

Moreover, a developer who's new to the project might get confused on why a
variable named `tasks` is declared with a boolean value. The keyword `tasks`
signifies a collection or simply put an array here. No other value other than a
collection should be assigned to this variable.

## How data type affects autocompletion in IDE?

Once a variable is assigned a value of a certain type, IDEs with an
autocompletion feature would provide suggestions based on the data type of the
declared value. The following shows the suggestions from an IDE when `tasks` is
of type `Boolean`:

<image>ide-suggestions-for-boolean.png</image>

And the following shows the suggestions from an IDE when `tasks` is of type
`Array`:

<image>ide-suggestions-for-array.png</image>

So, assigning a value of the appropriate type to a variable can improve the
development experience in an editor.

## Assigning the variable with appropriate data type

The following shows how the issues with the example that had been shown at the
beginning of this chapter can be fixed.

```jsx
const [tasks, setTasks] = useState([]);

const loadTasksData = async () => {
  try {
    const data = await fetchTasks();
    setTasks(data);
  } catch (err) {
    console.error(err);
  }
};

useEffect(() => {
  loadTasksData();
}, []);

if (tasks.length === 0) {
  return <h1>Empty</h1>;
}

return <h1>Recent: {tasks[0].content}</h1>;
```
