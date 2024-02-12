Until now, we have hard-coded the information regarding a product in our Product component. However, in real-world scenarios, this data is fetched from the backend. In this chapter, we will update the product component to display data retrieved from the backend.

We will use [Axios](https://github.com/axios/axios) to simplify this data retrieval process. Axios is a popular JavaScript library used for making HTTP requests. In this lesson, we will learn how to fetch data from an API using the Axios library. It is similar to the Fetch API and returns a JavaScript Promise.

If you need to refresh your understanding of Promises, refer to the [Promises section](https://courses.bigbinaryacademy.com/learn-javascript/#promises) in the BigBinary Academy.

## Benefits of choosing Axios over Fetch

Axios is often preferred over fetch due to its enhanced functionality and ease of use.

Axios simplifies the management of request and response interceptors, making it simpler to add authentication tokens or modify headers. Also, when we import Axios, we receive a singleton. So, whatever change we make will be reflected anywhere we use Axios.

One of the advantages of Axios is its ability to keep the code DRY. Here are some reasons why you would prefer to use Axios over fetch.

1. Ability to intercept and/or cancel requests
2. Better error handling
3. Automatic JSON parsing
4. Built-in XSRF protection
5. Better compatibility across different browsers

To install `axios`, run the following command:

```bash
yarn add axios@1.6.0
```

It offers different ways of making requests such as `GET`, `POST`, `PUT/PATCH`, and `DELETE`.

Here is a breakdown of each request method.

1. **Performing a `GET` request**

   ```js
   const response = await axios.get("https://example.com/sample");
   ```

2. **Performing a `POST` request**

   ```js
   const payload = {
     title: "My New Post",
     body: "This is the content of the post.",
   };

   const response = await axios.post("https://example.com/posts", payload);
   ```

3. **Performing a `PUT` request**

   ```js
   const payload = {
     title: "My updated Post",
     body: "This is the updated content of the post.",
   };

   const response = await axios.put("https://example.com/posts/1", payload);
   ```

4. **Performing a `DELETE` request**

   ```js
   const response = await axios.delete("https://example.com/posts/1");
   ```

## Using Query Parameters with Axios

Query parameters are a common way to pass additional information to a server when making an HTTP request. Query parameters are added to the end of a URL and are separated from the base URL by a question mark `?` followed by key-value pairs, each pair is separated by an ampersand `&` symbol.

Here's how query parameters look like in a URL.

```plaintext
https://example.com/search?key1=value1&key2=value2
```

Let's say for example we need to send the following as query parameters to `https://example.com/api/v1/search`.

```json
{
  "firstName": "Oliver",
  "lastName": "Smith"
}
```

There are two ways to send query parameters in a GET request using Axios.

1. **Appending Parameters to the URL**

   The most straightforward way to send query parameters is by appending them to the URL as key-value pairs.

   ```js
   axios.get("https://www.example.com/search?firstName=Oliver&lastName=Smith");
   ```

2. **Using `params` Configuration Object**

   In this method, you need to specify them as an object in the params property of the configuration object passed to the `axios.get()` method.

   ```js
   axios.get("https://www.example.com/search", {
     params: { firstName: "Oliver", lastName: "Smith" },
   });
   ```

The second approach is preferred over directly appending query parameters because it makes the code more readable and organized, especially when you have multiple query parameters.

Additionally, Axios automatically handles the encoding of special characters. For example, consider the scenario where you use string interpolation to insert a value into the URL.

```js
axios.get(`https://www.example.com/search?firstName=${name}`);
```

Let's imagine that the value of the `name` variable is `John&Doe`. Since it contains a special character, appending it directly to the URL will break URL semantics. The URL might appear as follows:

```plaintext
https://www.example.com/search?firstName=John&Doe
```

The backend server will misinterpret the character `&` as a separator between query parameters.

The usage of Axios `params` configuration guarantees that the query parameters are always properly encoded. The request URL would then be:

```plaintext
https://www.example.com/search?firstName=John%26Doe
```

> `%26` is the URL-encoded representation of the `&` character.

In cases where you have hard-coded string URLs with just one or two query parameters, you can still use the first approach. For example:

```js
axios.get("https://example.com?enabled=true");
```
