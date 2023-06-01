While making API requests if there's a requirement for a parent key in the payload, then we should automatically add that parent key via the API connector itself.

## What are API connectors?

As the application grows, the number of APIs to interact with the server will also increase. Keeping in mind the principle of modularity and reusability, we create API connector files where we define a function for each API endpoint defined in the server. For more details about how to build API connectors check [this](/learn-rubyonrails/building-and-organizing-apis#organizing-apis) chapter from `Learn Ruby on Rails Book`.

Let's understand with an example. Let's say we have an API endpoint `/tasks` which accepts a POST request and it creates a task according to the payload. For this endpoint we will make a file `tasks.js` inside `apis` directory and add the following lines:

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
const createTask = async() => {
  try{
    await tasksApi.create({ task: { title, user } })
  } catch() {
    //handle errors
  }
}
```

## Handle parent key

The `createTask` function mentioned in the above section will work fine but there is one problem with this approach. Every time we call `tasksApi.create`, we will have to explicitly pass in the parent key that is `task`.

With many APIs, it will be very difficult to keep track of all these parent keys and it becomes a nightmare to maintain them. So, to avoid this we will add the parent key to API connector functions itself, such that the developer only will have to worry about passing in the payload. Rest will be automatically handled by the connector itself.

So the updated code in `apis/tasks.js` will be:

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
const createTask = async() => {
  try{
    await tasksApi.create({ title, user }); // only passing payload
  } catch() {
    //handle errors
  }
}
```
