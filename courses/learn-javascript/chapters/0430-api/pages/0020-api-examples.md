There are many websites out there that provide us data that we can use. Let's look at some examples of getting to their data using their APIs.

Let's use an [Advice API](https://api.adviceslip.com/) to retrieve a specific piece of life advice from a large database of online advice. The API on this database is the set of rules through which we can get access to different parts of the database. You can read how to work with the Advice API on their [website](https://api.adviceslip.com/).

From a reading of their page, we can understand that to get a specific piece of advice by its **ID**, we use the format `https://api.adviceslip.com/advice/{id}`, where `{id}` is replaced by the **ID** of the advice we want to retrieve.

Let's try it with an example where we fetch advice with **ID 23**.

<codeblock language="javascript" type="lesson">
<code>
fetch('https://api.adviceslip.com/advice/23')
  .then(response => response.json())
  .then(data => console.log(`${data.slip.advice}`))
  .catch(error => console.error('Error:', error));
</code>
</codeblock>
