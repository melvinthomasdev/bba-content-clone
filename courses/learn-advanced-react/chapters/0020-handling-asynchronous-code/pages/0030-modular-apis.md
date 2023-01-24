As the application grows, the number of APIs to interact with the server will also increase. Keeping in mind the principle of modularity and reusability, we ought to create API connector files where we define a function for each API endpoint defined in the server.

For more details about how to build API connectors check [this](https://www.bigbinary.com/books/learn-rubyonrails-book/building-and-organizing-apis#organizing-apis) chapter from the `Learn Ruby on Rails Book`.

Let's say we have an API endpoint `/tasks` which accepts a POST request and it creates a task according to the payload. For this endpoint we will make a file `tasks.js` inside `apis` directory and add the following lines:

```jsx
import axios from 'axios';

const create = payload => axios.post('/tasks', payload);

const tasksApi = {
  create,
};

export default tasksApi;
```

Now when we want to create a new task we can invoke this `create` function with the required `payload`, like so:

```jsx
const createTask = async () => {
  try {
    await tasksApi.create({ task: { title, user } })
  } catch() {
    //handle errors
  }
}
```

## Handle parent key

The `createTask` function mentioned in the above section will work fine but there is one problem with this approach. Every time we call `tasksApi.create`, we will have to explicitly pass in the parent key that is `task`.

With many APIs, keeping track of all the parent keys and maintaining them can become a nightmare. By adding the parent key to the API connector functions, you only have to concern yourself with the payload.

The code in `apis/tasks.js` updated in the fashion would look like:

```jsx
import axios from 'axios';

const create = payload =>
  axios.post('/tasks', {
    task: payload, // here we have added the parent key
  });

const tasksApi = {
  create,
};

export default tasksApi;
```

So the parent key `task` is handled in the `create` function itself. And this simplifies the `createTask` function like so:

```jsx
const createTask = async () => {
  try {
    await tasksApi.create({ title, user }); // only passing payload
  } catch() {
    //handle errors
  }
}
```
