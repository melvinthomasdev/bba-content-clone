There are many websites out there
that provide us data that we can use.
Let's look at some examples of getting
to their data using their APIs.

Let's use an [Advice API](https://api.adviceslip.com/) to
get some life advice from a large database of
online advice. The API on this database
is the set of rules through which we
can get access to different parts of the
database. You can read how to work with the Advice API
on their [website](https://api.adviceslip.com/).

From a reading of their page, we
can understand that to get a random advice, we need
to use the format, `https://api.adviceslip.com/advice`.

Let's try it:

<codeblock language="javascript" type="lesson">
<code>
fetch('https://api.adviceslip.com/advice')
  .then(response => response.json())
  .then(data => console.log(`${data.slip.advice}`))
  .catch(error => console.error('Error:', error));
</code>
</codeblock>
