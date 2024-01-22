The `fetch()` method accepts two arguments `url` and `options`.

```js
fetch(url, {options})
```

- `url` - the **URL** to be accessed.
- `options` - the most common fetch options are `method`, `headers`, and `body`. This is an optional argument.

Let's look at the most **commonly** used `options` in details:

- **method:** Specifies the HTTP method for the request:

  - **GET:** Retrieve or read data from the server. It is the default value.

  - **POST:** Create or submit data to the server.

  - **PUT:** Update or replace existing data on the server.

  - **DELETE:** Remove or delete data from the server.

  - **PATCH:** To send specific changes or modifications, without replacing the entire data.

- **headers:** Allows us to set custom headers for the request. This includes **content type**, **authorization token**, or any other headers required by the server.

- **body:** It allows us to send data to the server in the request body.


Here's an example on sending data to a server using **POST** method:

<codeblock language="javascript" type="lesson">
<code>
const postData = {
  title: 'John',
  body: 'example',
  userId: 101,
};

fetch('https://jsonplaceholder.typicode.com/posts', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify(postData)
})
  .then(response => response.json())
  .then(data => {
    console.log(data);
  })
  .catch(error => {
    console.error('Error:', error);
  });
</code>
</codeblock>

In the above example, we created an object `postData`
with the data that needs to be sent.

We passed additional **options** to the `fetch` function,
as the HTTP method is **POST**.

The content type header is `application/json`, and
the `postData` object is JSON stringified as the request body.
