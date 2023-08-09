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
