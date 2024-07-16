Let's look at the following code:

<codeblock type="lesson" language="css">
<code>
<panel language="html">
<h1>What is Universe?</h1>
<p>
  The universe is all of space and time and their contents, including planets, stars, galaxies, and all other forms of matter and energy.
</p>
</panel>
<panel  language="css">
h1 {
  background-color: peachpuff;
}
p {
  background-color: peachpuff;
}
</panel>
</code>
</codeblock>

In the code above, we are setting the background color of
both the `h1` and `p` elements to peachpuff.

Now, let's use the `div` element to group them together.

<codeblock type="lesson" language="css">
<code>
<panel language="html">
<div>
  <h1>What is Universe?</h1>
  <p>
    The universe is all of space and time and their contents, including planets, stars, galaxies, and all other forms of matter and energy.
  </p>
</div>
</panel>
<panel  language="css">
div {
  background-color: peachpuff;
}
</panel>
</code>
</codeblock>

We can use the `div` element to wrap a group
of HTML elements that need the same CSS styles.
This makes it easy to ensure a consistent
look and layout for a group of related content.
