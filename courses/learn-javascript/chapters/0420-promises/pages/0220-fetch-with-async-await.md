Using `async/await` instead of `.then()` and `.catch()`
makes the code cleaner, and thus easier to understand.

Lets look at an example using `async/await` and `try/catch`:

<codeblock language="javascript" type="lesson">
<code>
const fetchData = async () => {
  try {
    const response = await fetch('https://jsonplaceholder.typicode.com/posts/1');
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.error('Error:', error);
  }
}

fetchData();
</code>
</codeblock>

In the above example, we are using `fetch` to make
an asynchronous request to retrieve data from the
JSONPlaceholder API and await its response.

And once the data is received, we are using `.json()`
method to parse the response as JSON data and console log it.
