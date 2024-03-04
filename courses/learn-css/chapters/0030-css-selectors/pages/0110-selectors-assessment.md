Using the **selector** knowledge that you have
gained so far, do the following:

1. Make all text green.

2. Make all heading text red.

3. Make all paragraph text blue.

4. Make the first five headings pink. Use class selector `heading-pink`.

5. Make the sixth heading to be brown. Use id selector `heading-brown`.

6. Make the fifth and sixth heading have a background of gold. Use class selector `background-gold`.

<codeblock language="css" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<body>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be interesting.</h1>
  <h1>This could be interesting.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>

  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
</body>
</panel>
<panel language="css">
body * {
  font-family: Lato;
  font-size: 2rem;
  text-align: center;
  padding: 0;
  margin: 1rem;
}

/* Write your code here */
</panel>
</code>
<solution>
<panel language="html">
<body>
  <h1 class="heading-pink">This could be a fun thing.</h1>
  <h1 class="heading-pink">This could be a fun thing.</h1>
  <h1 class="heading-pink">This could be a fun thing.</h1>
  <h1 class="heading-pink">This could be a fun thing.</h1>
  <h1 class="heading-pink background-gold">This could be a fun thing.</h1>
  <h1 id="heading-brown" class="background-gold">This could be interesting.</h1>
  <h1>This could be interesting.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>
  <h1>This could be a fun thing.</h1>

  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
  <p>This is a smaller fun thing...</p>
</body>
</panel>
<panel language="css">
body * {
  font-family: Lato;
  font-size: 2rem;
  text-align: center;
  padding: 0;
  margin: 1rem;
}

/* Write your code here */

* {
  color: green;
}

h1 {
  color: red;
}

p {
  color: blue;
}

.heading-pink {
  color: pink;
}

#heading-brown {
  color: brown;
}

.background-gold {
  background-color: gold;
}
</panel>
</solution>
</codeblock>

We are not displaying answer to this exercise.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://bigbinaryacademy.slack.com/join/shared_invite/zt-23dvxwolx-U9LYYbv4ycmODEA1cbNFgA#/shared-invite/email) to join the community.
