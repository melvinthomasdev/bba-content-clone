We are getting bored and need
a random activity to pursue.
In the code given below, get a
random activity from the database at
the BoredAPI website.

Read the documentation of boredAPI
at `http://www.boredapi.com/documentation`. Find
the correct way to get the random activity.
**Only update the value inside `fetch('')`.**

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
fetch('')
  .then(response => response.json())
  .then(data => console.log(data.activity))
  .catch(error => console.error('Error:', error));
</code>

<solution>
fetch('https://www.boredapi.com/api/activity')
  .then(response => response.json())
  .then(data => console.log(data.activity))
  .catch(error => console.error('Error:', error));
</solution>
</codeblock>
