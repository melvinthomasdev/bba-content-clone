We are feeling bored and need a specific activity to pursue. In the code given below, we will fetch an activity by its key from the database at the BoredAPI website.

Read the documentation of boredAPI at [https://bored.api.lewagon.com/documentation](https://bored.api.lewagon.com/documentation). Find the correct way to get an activity by its key. Let us use the key `5881028`. **Only update the value inside `fetch('')`.**

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
fetch('')
  .then(response => response.json())
  .then(data => console.log(data.activity))
  .catch(error => console.error('Error:', error));
</code>

<solution>
fetch('https://bored.api.lewagon.com/api/activity?key=5881028')
  .then(response => response.json())
  .then(data => console.log(data.activity))
  .catch(error => console.error('Error:', error));
</solution>
</codeblock>
