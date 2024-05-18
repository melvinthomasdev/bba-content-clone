The **Fetch API** is a feature in web browsers that
allows developers to make network requests to
retrieve data from servers or send data to servers.
It simplifies the process of making asynchronous HTTP
requests and handling the responses.

Let's first look at an example code to **get data** from a server:

<codeblock language="javascript" type="lesson">
<code>
fetch('https://jsonplaceholder.typicode.com/posts/1')
  .then(response => response.json())
  .then(data => {
    console.log(data);
  })
  .catch(error => {
    console.error('Error:', error);
  });
</code>
</codeblock>

In the above example, `fetch` takes the **URL** of the resource we want
to fetch as its argument.

This `fetch` request then returns a **Promise** object, and we use the
`.then()` and `.catch()` on the Promise object.

The `response.json()` method is used to parse the response as **JSON**
and returns another Promise that resolves to the actual data.

The `.then()` block receives the parsed data, and logs the data to the console.

And, the `.catch()` block is used to handle any errors that may occur during
the request or parsing of the response.
